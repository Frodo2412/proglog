0.6::moneda(cruz); 0.4::moneda(cara).

0.7::urna1(rojo); 0.3::urna1(azul).

0.5::urna2(azul); 0.3::urna2(rojo); 0.2::urna2(negro).

mismo_color :- urna1(Color), urna2(Color).

ganar :- mismo_color.
ganar :- moneda(cara), urna1(azul).
ganar :- moneda(cara), urna2(azul).

query(ganar).
