#include <iostream>
#include <SDL2/SDL_thread.h>
#include <SDL2/SDL.h>
#include <math.h>
#include <iostream>
#include <time.h>

#define OKNO_SIRKA 720
#define OKNO_VYSKA 480
#define SQUARE_SIZE 4

int world_width = OKNO_SIRKA / SQUARE_SIZE;
int world_height = OKNO_VYSKA / SQUARE_SIZE;

bool priamaLogika = true;
bool nahodneCiernePolia = false;
int pocetCiernychPoli = 1000;

bool world[180][120];
bool mravce[180][120];

typedef struct dataMravca {
    bool live;
    int antX;
    int antY;
    unsigned int antSmer;
    int id;
} DATA;

SDL_mutex *mut;
SDL_cond *zober;
SDL_cond *vyloz;


int mravecFun(void *args) {
    DATA *data = (DATA *) args;
    printf("Mravec %d zacina vykreslovat\n", data->id);

    while (data->live) {
    printf("mravec id: %d\n", data->id);
        if (priamaLogika) {
            if (world[data->antX][data->antY]) {
                data->antSmer--;
            } else {
                data->antSmer++;
            }
        } else {
            if (world[data->antX][data->antY]) {
                data->antSmer++;
            } else {
                data->antSmer--;
            }
        }

        data->antSmer %= 4;

        SDL_LockMutex(mut);

        world[data->antX][data->antY] = !(world[data->antX][data->antY]);
        mravce[data->antX][data->antY] = false;

        switch (data->antSmer) {
            case 0:
                data->antY--;
                break;
            case 1:
                data->antX++;
                break;
            case 2:
                data->antY++;
                break;
            case 3:
                data->antX--;
                break;
        }

        if (data->antX == -1) {
            data->antX = world_width - 1;
        } else if (data->antX == world_width) {
            data->antX = 0;
        }

        if (data->antY == -1) {
            data->antY = world_height - 1;
        } else if (data->antY == world_height) {
            data->antY = 0;
        }

        if (mravce[data->antX][data->antY]) {
            printf("mravce sa stretli %d\n", data->id);
            SDL_UnlockMutex(mut);
            data->live = false;
        } else {
            mravce[data->antX][data->antY] = true;
        }

        SDL_UnlockMutex(mut);
        SDL_Delay(1);

    }
    return 0;
}


int main(int argc, char *args[]) {
    srand(time(0));

    SDL_Renderer *renderer;
    SDL_Event event;
    SDL_Window *window;

    SDL_Init(SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer(OKNO_SIRKA, OKNO_VYSKA, 0, &window, &renderer);

    const char *title = {"Langton's Ant"};
    SDL_SetWindowTitle(window, title);


    for (int i = 0; i < world_width; ++i) {
        for (int j = 0; j < world_height; ++j) {
            world[i][j] = false;
            mravce[i][j] = false;
        }
    }

    if (nahodneCiernePolia) {
        for (int i = 0; i < pocetCiernychPoli; ++i) {
            int nahX = rand() % world_width;
            int nahY = rand() % world_height;
            world[nahX][nahY] = true;
        }
    }

    mut = SDL_CreateMutex();

    int pocetMravcov = 50;
    SDL_Thread *mravec[pocetMravcov];
    DATA dataMravca[pocetMravcov];

    for (int i = 0; i < pocetMravcov; ++i) {
        dataMravca[i].antX = rand() % (OKNO_SIRKA / SQUARE_SIZE);
        dataMravca[i].antY = rand() % (OKNO_VYSKA / SQUARE_SIZE);
        mravce[dataMravca[i].antX][dataMravca[i].antY] = true;
        dataMravca[i].live = true;
        dataMravca[i].antSmer = 0;
        dataMravca[i].id = i;
        mravec[i] = SDL_CreateThread(mravecFun, "lets work", &dataMravca[i]);
    }

    while (!(SDL_PollEvent(&event) && event.type == SDL_QUIT)) {

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        SDL_RenderClear(renderer);

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
        for (int x = 0; x < world_width; ++x) {
            for (int y = 0; y < world_height; ++y) {
                if (world[x][y]) {
                    for (int i = x * SQUARE_SIZE; i < x * SQUARE_SIZE + SQUARE_SIZE; ++i) {
                        for (int j = y * SQUARE_SIZE; j < y * SQUARE_SIZE + SQUARE_SIZE; ++j) {
                            SDL_RenderDrawPoint(renderer, i, j);
                        }
                    }
                }
            }
        }

        // vykreslenie mravcov
        SDL_SetRenderDrawColor(renderer, 255, 0, 0, 0);
        for (int mravec = 0; mravec < pocetMravcov; ++mravec) {
            if (dataMravca[mravec].live) {
                for (int i = dataMravca[mravec].antX * SQUARE_SIZE;
                     i < dataMravca[mravec].antX * SQUARE_SIZE + SQUARE_SIZE; ++i) {
                    for (int j = dataMravca[mravec].antY * SQUARE_SIZE;
                         j < dataMravca[mravec].antY * SQUARE_SIZE + SQUARE_SIZE; ++j) {
                        SDL_RenderDrawPoint(renderer, i, j);
                    }
                }
            }
        }

        SDL_RenderPresent(renderer);
    }

    for (int i = 0; i < pocetMravcov; ++i) {
        SDL_WaitThread(mravec[i], NULL);
    }

    SDL_DestroyMutex(mut);

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
