#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char nn09A1Str[] = "a1 (noneg09): ";
char procA1Str[] = "processed a1: ";
char procA2Str[] = "          a2: ";
char procA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char reply;
               int used1,
                   used2,
                   used3,
                   target,
                   intHolder,
                   count,
                   iter,
                   *hopPtr1,
                   *hopPtr11,
                   *hopPtr2,
                   *hopPtr3,
                   *endPtr1,
                   *endPtr2,
                   *endPtr3;

               reply = 'y';
               while (reply != 'n' && reply != 'N')
               {
                  used1 = 0;
                  hopPtr1 = a1;
                  while (reply != 'n' && reply != 'N')
                  {
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
                     if (used1 < 12)
                     {
                        cout << emiStr;
                        cin >> reply;
                     }
                     else
                     {
                        cout << moStr << 12 << ieStr << endl;
                        reply = 'n';
                     }
                  }

                  cout << begA1Str;
                  if (used1 > 0)
                  {
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     do
                     {
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
                     }
                     while (hopPtr1 < endPtr1);
                  }
                  cout << endl;

                  if (used1 > 0)
                  {
                     for (hopPtr1 = a1, endPtr1 = a1 + used1;  // multi-init
                                           hopPtr1 < endPtr1;  // test
                                                    ++hopPtr1) // update
                     {
                        target = *hopPtr1;
                        if (target < 0 || target > 9)
                        {
                           for (hopPtr11 = hopPtr1 + 1;  // multi-init
                                    hopPtr11 < endPtr1;  // test
                                             ++hopPtr11) // update
                           {
                              *(hopPtr11 - 1) = *hopPtr11;
                           }
                           --used1;
                           --endPtr1;
                           --hopPtr1;
                        }
                     }

                     cout << nn09A1Str;
                     if (used1 > 0)
                     {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        do
                        {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
                        }
                        while (hopPtr1 < endPtr1);
                     }
                     cout << endl;

                     used2 = 0;
                     used3 = 0;
                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr1 = a1 + used1;
                     while (hopPtr1 < endPtr1)
                     {
                        intHolder = *hopPtr1;
                        *hopPtr2 = intHolder;
                        ++used2;
                        ++hopPtr2;
                        *hopPtr3 = intHolder;
                        ++used3;
                        ++hopPtr3;
                        ++hopPtr1;
                     }

                     iter = 0;
                     do
                     {
                        ++iter;
                        count = 0;
                        if (iter == 1)
                        {
                           for (hopPtr1 = a1, endPtr1 = a1 + used1;  // multi-init
                                                 hopPtr1 < endPtr1;  // test
                                                          ++hopPtr1) // update
                           {
                              target = *hopPtr1;
                              if (target != 5)
                              {
                                 ++count;
                              }
                              else
                              {
                                 if (count != 0)
                                 {
                                    *(hopPtr1 - count) = *hopPtr1;
                                 }
                              }
                           }
                           used1 -= count;
                           if (used1 == 0)
                           {
                              hopPtr1 = a1;
                              *hopPtr1 = -99;
                              ++used1;
                           }
                        }
                        else
                        {
                           if (iter == 2)
                           {
                              for (hopPtr2 = a2, endPtr2 = a2 + used2;  // multi-init
                                                    hopPtr2 < endPtr2;  // test
                                                             ++hopPtr2) // update
                              {
                                 target = *hopPtr2;
                                 if (target > 4)
                                 {
                                    ++count;
                                 }
                                 else
                                 {
                                    if (count != 0)
                                    {
                                       *(hopPtr2 - count) = *hopPtr2;
                                    }
                                 }
                              }
                              used2 -= count;
                              if (used2 == 0)
                              {
                                 hopPtr2 = a2;
                                 *hopPtr2 = -99;
                                 ++used2;
                              }
                           }
                           else
                           {
                              for (hopPtr3 = a3, endPtr3 = a3 + used3;  // multi-init
                                                    hopPtr3 < endPtr3;  // test
                                                             ++hopPtr3) // update
                              {
                                 target = *hopPtr3;
                                 if (target < 6)
                                 {
                                    ++count;
                                 }
                                 else
                                 {
                                    if (count != 0)
                                    {
                                       *(hopPtr3 - count) = *hopPtr3;
                                    }
                                 }
                              }
                              used3 -= count;
                              if (used3 == 0)
                              {
                                 hopPtr3 = a3;
                                 *hopPtr3 = -99;
                                 ++used3;
                              }
                           }
                        }
                     }
                     while (iter < 3);
                  }

                  cout << procA1Str;
                  if (used1 > 0)
                  {
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     do
                     {
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
                     }
                     while (hopPtr1 < endPtr1);
                  }
                  cout << endl;

                  cout << procA2Str;
                  if (used2 > 0)
                  {
                     hopPtr2 = a2;
                     endPtr2 = a2 + used2;
                     do
                     {
                        cout << *hopPtr2 << ' ' << ' ';
                        ++hopPtr2;
                     }
                     while (hopPtr2 < endPtr2);
                  }
                  cout << endl;

                  cout << procA3Str;
                  if (used3 > 0)
                  {
                     hopPtr3 = a3;
                     endPtr3 = a3 + used3;
                     do
                     {
                        cout << *hopPtr3 << ' ' << ' ';
                        ++hopPtr3;
                     }
                     while (hopPtr3 < endPtr3);
                  }
                  cout << endl;

                  cout << dacStr;
                  cin >> reply;
               }

               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}
