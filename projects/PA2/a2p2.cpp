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

int main() {
    char reply;
    int used1,
        used2,
        used3,
        truncAvg,
        found,
        sum,
        *hopPtr1,
        *hopPtr11,
        *hopPtr2,
        *hopPtr3,
        *endPtr1,
        *endPtr11,
        *endPtr2,
        *endPtr3;

    reply = 'y';
    //while (reply != 'n' && reply != 'N')
    goto WTest1;
    begW1://               {
    used1 = 0;
    hopPtr1 = a1;
    //while (reply != 'n' && reply != 'N')
    goto WTest2;
    begW2://                  {
    cout << einStr;
    cout << (used1 + 1);
    cout << ':' << ' ';
    cin >> *hopPtr1;
    ++used1;
    ++hopPtr1;
    //if (used1 < 12)
    if (used1 >= 12) goto else1;
//                     {
    cout << emiStr;
    cin >> reply;
    goto endI1;
//                     }
    else1://                    else
//                     {
    cout << moStr << 12 << ieStr << endl;
    reply = 'n';
    endI1://                     }

    WTest2:
    if (reply != 'n' && reply != 'N') goto begW2;
    endW2://                  }

    cout << begA1Str;
    //if (used1 > 0)
    if (used1 <= 0) goto endI2;
    begI2://                  {
    hopPtr1 = a1;
    endPtr1 = a1 + used1;
    //do
    begDW1://                     {
    cout << *hopPtr1 << ' ' << ' ';
    ++hopPtr1;
    endDW1://                     }
    //while (hopPtr1 < endPtr1);
    DWTest1:
    if (hopPtr1 < endPtr1) goto begDW1;
    endI2://                  }
    cout << endl;

    //if (used1 > 1)
    if (used1 <= 1) goto else3;
    begI3://                  {
    hopPtr1 = a1;
    endPtr1 = a1 + used1 - 1;
    //while (hopPtr1 < endPtr1)
    goto WTest3;
    begW3://                     {
    found = 0;
    //for (hopPtr2 = hopPtr1 + 1, endPtr2 = a1 + used1; hopPtr2 < endPtr2; ++hopPtr2)
    hopPtr2 = hopPtr1 + 1;
    endPtr2 = a1 + used1;
    goto FTest1;
    begF1://                        {
    //if (*hopPtr2 == *hopPtr1)
    if (*hopPtr2 != *hopPtr1) goto endI4;
    begI4://                           {
    //if (found == 1)
    if (found != 1) goto else5;
    begI5://                              {
    //for (hopPtr3 = hopPtr2 + 1, endPtr3 = a1 + used1; hopPtr3 < endPtr3; ++hopPtr3)
    hopPtr3 = hopPtr2 + 1;
    endPtr3 = a1 + used1;
    goto FTest2;
    begF2://                                 {
    *(hopPtr3 - 1) = *hopPtr3;
    ++hopPtr3;
    FTest2:
    if (hopPtr3 < endPtr3) goto begF2;
    endF2://                                 }
    --used1;
    --endPtr1;
    --endPtr2;
    --endPtr3;
    --hopPtr2;
    goto endI5;
//                              }
    else5://                              else
//                              {
    ++found;
    endI5://                              }
    endI4://                           }
    ++hopPtr2;
    FTest1:
    if (hopPtr2 < endPtr2) goto begF1;
    endF1://                        }
    ++hopPtr1;
    WTest3:
    if (hopPtr1 < endPtr1) goto begW3;
    endW3://                     }

    cout << nn09A1Str;
    //if (used1 > 0)
    if (used1 <= 0) goto endI6;
    begI6://                     {
    hopPtr1 = a1;
    endPtr1 = a1 + used1;
    //do
    begDW2://                        {
    cout << *hopPtr1 << ' ' << ' ';
    ++hopPtr1;
    endDW2://                        }
    //while (hopPtr1 < endPtr1);
    DWTest2:
    if (hopPtr1 < endPtr1) goto begDW2;
    endI6://                     }
    cout << endl;

    //if (used1 > 0)
    if (used1 <= 0) goto endI7;
    begI7://                     {
    sum = 0;
    hopPtr1 = a1 + used1 - 1;
    endPtr1 = a1;
    //do
    begDW3://                        {
    sum += *hopPtr1;
    --hopPtr1;
    endDW3://                        }
    //while (hopPtr1 >= endPtr1);
    //truncAvg = sum / used1;
    DWTest3:
    if (hopPtr1 >= endPtr1) goto begDW3;
    truncAvg = sum / used1;

    used2 = 0;
    used3 = 0;
    hopPtr2 = a2;
    hopPtr3 = a3;
    //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
    hopPtr1 = a1;
    endPtr1 = a1 + used1;
    goto FTest3;
    begF3://                        {
    //if (*hopPtr1 != truncAvg)
    if (*hopPtr1 == truncAvg) goto endI8;
    begI8://                           {
    //if (*hopPtr1 < truncAvg)
    if (*hopPtr1 >= truncAvg) goto elseI9;
    begI9://                              {
    *hopPtr2 = *hopPtr1;
    ++used2;
    ++hopPtr2;
    goto endI9;
//                              }
    elseI9://                              else
//                              {
    *hopPtr3 = *hopPtr1;
    ++used3;
    ++hopPtr3;
    endI9://                              }
    //for (hopPtr11 = hopPtr1 + 1, endPtr11 = a1 + used1; hopPtr11 < endPtr11; ++hopPtr11)
    hopPtr11 = hopPtr1 + 1, endPtr11 = a1 + used1;
    goto FTest4;

    begF4://                              {
    *(hopPtr11 - 1) = *hopPtr11;
    ++hopPtr11;
    FTest4:
    if (hopPtr11 < endPtr11) goto begF4;
    endF4://                              }
    --used1;
    --endPtr1;
    --hopPtr1;
    endI8://                           }
    ++hopPtr1;
    FTest3:
    if (hopPtr1 < endPtr1) goto begF3;
    endF3://                        }

    //if (used1 == 0)
    if (used1 != 0) goto endI10;
    begI10://                        {
    *(a1 + 0) = truncAvg;
    ++used1;
    endI10://                        }
    endI7://                     }
    goto endI3;
//                  }
    else3://                  else
//                  {
    hopPtr1 = a1;
    cout << nn09A1Str;
    cout << *hopPtr1;
    cout << endl;
    used2 = 0;
    used3 = 0;
    endI3://                  }

    cout << procA1Str;
    //if (used1 > 0)
    if (used1 <= 0) goto endI11;
    begI11://                  {
    hopPtr1 = a1;
    endPtr1 = a1 + used1;
    //do
    begDW4://                     {
    cout << *hopPtr1 << ' ' << ' ';
    ++hopPtr1;
    endDW4://                     }
    //while (hopPtr1 < endPtr1);
    DWTest4:
    if (hopPtr1 < endPtr1) goto begDW4;
    endI11://                  }
    cout << endl;

    cout << procA2Str;
    //if (used2 > 0)
    if (used2 <= 0) goto endI12;
    begI12://                  {
    hopPtr2 = a2;
    endPtr2 = a2 + used2;
    //do
    begDW5://                     {
    cout << *hopPtr2 << ' ' << ' ';
    ++hopPtr2;
    endDW5://                     }
    //while (hopPtr2 < endPtr2);
    DWTest5:
    if (hopPtr2 < endPtr2) goto begDW5;
    endI12://                  }
    cout << endl;

    cout << procA3Str;
    //if (used3 > 0)
    if (used3 <= 0) goto endI13;
    begI13://                  {
    hopPtr3 = a3;
    endPtr3 = a3 + used3;
    //do
    begDW6://                     {
    cout << *hopPtr3 << ' ' << ' ';
    ++hopPtr3;
    endDW6://                     }
    //while (hopPtr3 < endPtr3);
    DWTest6:
    if (hopPtr3 < endPtr3) goto begDW6;
    endI13://                  }
    cout << endl;

    cout << dacStr;
    cin >> reply;
    WTest1:
    if (reply != 'n' && reply != 'N') goto begW1;
    endW1://               }

    cout << dlStr << '\n';
    cout << byeStr << '\n';
    cout << dlStr << '\n';

    return 0;
}