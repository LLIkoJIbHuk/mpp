#include <iostream>

extern "C" float* SumR(int, float*);

int main() {

	int n = 0;//����� ��������� �������
	float* x = nullptr;//������ �����

	std::cout << "Input n: ";
	std::cin >> n;

	x = new float[n];

	std::cout << "\nInput " << n << " elements of x:\n";

	for (int i = 0; i < n; i++) {
		std::cout << "x[" << i << "] = ";
		std::cin >> x[i];//�������� ����
	}

	float* R = nullptr;
	R = SumR(n, x);//�������� �� ���������� ��������������� ������

	std::cout << "\nResult R:\n";

	for (int i = 0; i < n; i++) {
		std::cout << "R[" << i << "] = " << R[i] << std::endl;//����� �� �����
	}
	return 0;
}