.686
.model flat,stdcall
.stack 100h
.data
arr_x dd 0.0 ;������������� ������
	  dd 0.0
	  dd 4.0

arr_y dd 0.0
	  dd 3.0
	  dd 0.0

arr_len dd 0.0
		dd 0.0
		dd 0.0
answer dd 0.0
temp dd 0.0
operator dd -1.0
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	finit;������������� ������������
	fld temp;�������� ���� � st(0), ����� �� ������������ � st(1)

	;������� ����� ������� �������
	fld arr_x[0*4];�������� � st(0) x1
	fsub arr_x[1*4];�������� �� st(0) x2
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fstp arr_len[0*4];�������� ����� ������� � ������ ������� �������

	fld arr_y[0*4];�������� � st(0) y1
	fsub arr_y[1*4];�������� �� st(0) y2
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fadd arr_len[0*4];���������� st(0) � ����� ������� �� ������� �������� �������
	fstp arr_len[0*4];�������� �������� �� st(0) � ������ ������� �������

	;������� ����� ������� �������
	fld arr_x[1*4];�������� � st(0) x2
	fsub arr_x[2*4];�������� �� st(0) x3
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fstp arr_len[1*4];�������� ����� ������� �� ������ ������� �������

	fld arr_y[1*4];�������� � st(0) y2
	fsub arr_y[2*4];�������� �� st(0) y3
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fadd arr_len[1*4];���������� st(0) � ����� ������� �� ������� �������� �������
	fstp arr_len[1*4];�������� �������� �� st(0) �� ������ ������� �������

	;������� ����� �������� �������
	fld arr_x[0*4];�������� � st(0) x1
	fsub arr_x[2*4];�������� �� st(0) x3
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fstp arr_len[2*4];�������� ����� ������� � ������ ������� �������

	fld arr_y[0*4];�������� � st(0) y1
	fsub arr_y[2*4];�������� �� st(0) y3
	fst temp;�������� ��������� � temp
	fmul temp;�������� � ������� st(0)
	fadd arr_len[2*4];���������� st(0) � ����� ������� �� �������� �������� �������
	fstp arr_len[2*4];�������� �������� �� st(0) � ������ ������� �������

	;������� ���������

	fld arr_len[0*4];�������� � st(0) ����� ������� �������
	fmul operator;������ st(0) �������������
	fadd arr_len[1*4];���������� ����� ������� �������
	fadd arr_len[2*4];���������� ����� �������� �������
	
	fcomi st, st(1);���������� st(0) � ����
	je L1;���� ����� �������� ����� ����, �� ��������� � ����� L1
	fstp temp;������� st(0) �� �����

	fld arr_len[1*4];�������� � st(0) ����� ������� �������
	fmul operator;������ st(0) �������������
	fadd arr_len[2*4];���������� ����� �������� �������
	fadd arr_len[0*4];���������� ����� ������� �������

	fcomi st, st(1);���������� st(0) � ����
	je L1;���� ����� �������� ����� ����, �� ��������� � ����� L1
	fstp temp;������� st(0) �� �����

	fld arr_len[2*4];�������� � st(0) ����� �������� �������
	fmul operator;������ st(0) ������������
	fadd arr_len[0*4];���������� ����� ������� �������
	fadd arr_len[1*4];���������� ����� ������� �������

	fcomi st, st(1);���������� st(0) � ����
	je L1;���� ����� �������� ����� ����, �� ��������� � ����� L1
	fstp temp;������� st(0) �� �����

	mov answer, -1; -1 ������, ��� ����������� �� �������������
	jmp L2;����������� ���������

	L1:
		;���� �� ������ ����, �� ����������� �������������
		fstp answer;answer = 0.0, �� ���� c^2 = a^2 + b^2. ����������� �������������
		fstp temp;
	L2:
		;����� ���������
exit:
Invoke ExitProcess,1
End Start