#include <stdio.h>

struct Book
{
    int id;
    double rating;
    int pages;
};

long total_pages(struct Book *, long);
double average_rating(struct Book *, long);
long count_above(struct Book*, long, double);
struct Book* best_book(struct Book*, long);
double weighted_rating(struct Book*, long);

int main(void)
{
    struct Book books[] = {
        {1, 4.5, 300},
        {2, 3.8, 150},
        {3, 4.9, 500},
        {4, 4.5, 200},
    };
    long n = 4;

    printf("total_pages: %ld\n", total_pages(books, n));
    printf("average_rating: %f\n", average_rating(books, n));
    printf("count_above 4.0: %ld\n", count_above(books, n, 4.0));
    struct Book* b = best_book(books, n);
    printf("best_book id: %d\n", b->id);
    printf("weighted_rating: %f\n", weighted_rating(books, n));
    return 0;
}