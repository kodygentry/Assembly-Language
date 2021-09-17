#include <iostream>
using namespace std;

int  hasDup(int a[], int n);
int  exists(int a[], int n, int target);
void CoutCstr(char cstr[]);
void CoutCstrNL(char cstr[]);
void CoutOneInt(int oneInt);
void PopulateArray(int a[], int* usedPtr, int cap);
void ShowArray(int a[], int used);
void ShowArrayLabeled(int a[], int used, char label[]);

int main()
{
         int a1[12];
         int used1;
         char reply;
         char ueStr[]   = "u-entered a1: ";
         char dup0Msg[] = "a1 has no dups";
         char dupsMsg[] = "a1 has 1+ dups";
         char dacStr[]  = "Do another case? (n or N = no, others = yes) ";
         char dlStr[]   = "================================";
         char byeStr[]  = "bye...";

         reply = 'y';
         goto WTest1;
begW1:
         PopulateArray(a1, &used1, 12);
         ShowArrayLabeled(a1, used1, ueStr);

         if ( hasDup(a1, used1) != 0 )
         {
            CoutCstrNL(dupsMsg);
         }
         else
         {
            CoutCstrNL(dup0Msg);
         }

         cout << dacStr;
         cin >> reply;
WTest1:
         if (reply == 'n') goto xitW1;
         if (reply != 'N') goto begW1;
xitW1:
         cout << dlStr << '\n';
         cout << byeStr << '\n';
         cout << dlStr << '\n';
         return 0;
}

int  hasDup(int* arrBegPtr, int numEle)
{
        if (numEle <= 1)
        {
           return 0;
        }

        if ( exists(arrBegPtr + 1, numEle - 1, *arrBegPtr) != 0 )
        {
           return 1;
        }

        return hasDup(arrBegPtr + 1, numEle -1);
}

int  exists(int* arrBegPtr, int numEle, int target)
{
        if (numEle <= 0)
        {
           return 0;
        }

        if (*arrBegPtr == target)
        {
           return 1;
        }

        return exists(arrBegPtr + 1, numEle - 1, target);
}

void CoutCstr(char cstr[])
{
         cout << cstr;
}

void CoutCstrNL(char cstr[])
{
         CoutCstr(cstr);
         cout << '\n';
}

void CoutOneInt(int oneInt)
{
         cout << oneInt;
}

void PopulateArray(int a[], int* usedPtr, int cap)
{
         char reply;
         char einStr[]    = "Enter integer #";
         char moStr[]     = "Max of ";
         char ieStr[]     = " ints entered...";
         char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
         int *hopPtr;

         reply = 'y';
         *usedPtr = 0;
         hopPtr = a;
         goto WTest2;
begW2:
         CoutCstr(einStr);
         CoutOneInt(*usedPtr + 1);
         cout << ':' << ' ';
         cin >> *hopPtr;
         ++(*usedPtr);
         ++hopPtr;
         if (*usedPtr >= cap) goto else1;
         CoutCstr(emiStr);
         cin >> reply;
         goto endI1;
else1:
         CoutCstr(moStr);
         CoutOneInt(cap);
         CoutCstr(ieStr);
         cout << endl;
         reply = 'n';
endI1:
WTest2:
         if (reply == 'n') goto xitW2;
         if (reply != 'N') goto begW2;
xitW2:
         return;
}

void ShowArray(int a[], int used)
{
         int *hopPtr;
         int *endPtr;

         if (used <= 0) goto endI2;
         hopPtr = a;
         endPtr = a + used;
begDW1:
         cout << *hopPtr << ' ' << ' ';
         ++hopPtr;
endDW1:
DWTest1:
         if (hopPtr < endPtr) goto begDW1;
endI2:
         cout << endl;
}

void ShowArrayLabeled(int a[], int used, char label[])
{
         CoutCstr(label);
         ShowArray(a, used);
}

