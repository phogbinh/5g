#include <bits/stdc++.h>

using namespace std;

int EMBB;
int URLLC;
int TIME_SLOT;
int TIME_MINISLOT;

default_random_engine g_positionEngine; // same seed all execution

void getConfig() {
  ifstream file;
  file.open("config.txt");
  file >> EMBB >> URLLC >> TIME_SLOT >> TIME_MINISLOT;
  file.close();
}

string getMatlabFormat(int x, int y) {
  return to_string(x) + "," + to_string(y);
}

void genEmbb() {
  ofstream file;
  file.open("./data/embb.txt");
  uniform_int_distribution<int> uniform(0, 1000);
  for (int i = 0; i < EMBB; ++i) {
    file << getMatlabFormat(uniform(g_positionEngine), uniform(g_positionEngine)) << endl;
  }
  file.close();
}

void genUrllc(int timeSlot, int timeMinislot) {
  ofstream file;
  file.open("./data/urllc-" + to_string(timeSlot) + "-" + to_string(timeMinislot) + ".txt");
  uniform_int_distribution<int> uniform(0, 1000);
  for (int i = 0; i < URLLC; ++i) {
    file << getMatlabFormat(uniform(g_positionEngine), uniform(g_positionEngine)) << endl;
  }
  file.close();
}

int main() {
  getConfig();
  genEmbb();
  genUrllc(0, 0);
  genUrllc(TIME_SLOT - 1, TIME_MINISLOT - 1);
}
