clc;
clear;
close all;

sequence = 'ATGCGATCGATCGATTTAGC';

base_A_arr = sequence == 'A' % Notice that I am skipping the semicolon

sum(base_A_arr)

A = sum(sequence == 'A');
T = sum(sequence == 'T');
G = sum(sequence == 'G');
C = sum(sequence == 'C');

counts = [A T G C];

bar(counts)

xticklabels({'A','T','G','C'})
xlabel('Nucleotide')
ylabel('Count')
title('DNA Base Composition')

fprintf('A: %d\n', A);
fprintf('T: %d\n', T);
fprintf('G: %d\n', G);
fprintf('C: %d\n', C);
