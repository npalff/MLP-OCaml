open Format

(* Comentários *)


(* Em Ocaml, temos um tipo "unit" ele consiste do valor "()"
que representa uma expressão sem valor

Uma vez que Ocaml é uma linguagem funcional, todas as funções devem receber e
   devolver um valor. Quando a função não precisa receber nenhum argumento ou
   não retornará nenhum outro valor o tipo "unit"será utilizado.
*)    


(***  Tipos da Linguagem e Operadores ***)

(* Inteiros - int *)
let int1 = 10
  
(* Os operadores podem ser chamados como funções *)

let ex1 =  (+) 5 14
let ex2 = 5 + 14  


(* Float - float *)
let float1 = 19.4

(*  Em Ocaml operadores de inteiros e floats são diferentes, 
não há sobrecarga desses operadores na linguagem *) 

let ex3 = (+.) 2.5 3.7
let ex4 =  2.5 +. 3.7

let ex5 = 20/3
let ex6 = 20.0 /. 3.0

let ex7 = 19 mod 3 

let ex8 = 3.9 -. 2.8
let ex9 =  2 - 9  

(* Uma exceção é o menos unário, para  tornar o número negativo 
   este é um operador polimórfico*)
let neg1 = -19
let neg2 = -16.9
  (* Mas ainda existem os operadores para apenas cada um dos tipos*)
let neg3 = ~- 19
let neg4 = ~-. 16.9


(* Em Ocaml podemos criar e/ou redefinir os operadores já existentes *)

let ex10 = 5+3
           
let ex10M = let (+) a b = a-b in
  5+3;;

(* Caracteres - char *)
let char1 = 'a'

(* String - string *)
let str1 = "Exemplo de String"

(* Concatenação de Strings *)
let str2 = "Vamos formar "
let str3 = "uma frase!"
let novaStr1 = str2 ^ str3
let novaStr2 = "Hello"^" World!"
  
(* Em Ocaml uma string não é um vetor de caracteres.
   mas podemos utilizar juntos mediante uma conversão através do comando
   "String.make 1 <char>" como demonstrado abaixo: *)
let novaStr3 = (String.make 1 'E')^"xemplo de String"  


(* Boolenos - bool *)
let varT = true
let varF = false

(* Unidade - unit *)
let unidade = ()

(* Tuplas -> n-tuple *)
    (* Os elementos de uma tupla não precisam ser do mesmo tipo *)
let tupla1 = 1,true
let tupla2 = true,1
let tupla3 = (19,false) 
    (* Note que o tipo de tupla1 e tupla2 são diferentes,
      mas o tipo de tupla1 e tupla3 são os mesmos, 
      ou seja, a ordem importa na definição do tipo da tupla*)           
let tupla4 = 2,3,true,"string qualquer"
let tupla5 = ("outra string", 'b', 19)

(* Listas - list *)
    (* Listas devem ser homogeneas em Ocaml, ou seja, todos os seu elementos
      devem ser de um mesmo tipo 
      O separador dos termos de uma lista em Ocaml é o ";" *)

let ls1 = [1;2;3]
let ls2 = 1::2::3::[]
let ls3 = "str1"::[]
let ls4 = [1,2] (* Note que esta será uma lista de um elemento do tipo tupla 
                   int*int *)
let ls5 = [1,2;3,8]
let ls6 = [true,2;false,3]
          
    
(* A lista [1;"str"] não é aceita pela linguagem por não ser homogenea
A lista [false,2;3,false] também não é aceita pelo mesmo motivo*)                   

(** Operações sobre listas **)
let lst1 = [1;5;6;8;7;9;10]
let lst2 = [3;6;7;9;12;14;15]
let lst3 = [true;false;false;true]
let lst4 = ['a';'g';'k';'p']
let lst5 = ["str0";"str1";"str2";"str3"]

           
(* Construtor de listas "::" *)

let lst6 = 'z'::lst4

(* Para acessar um único item da lista *)
let nth1 = List.nth lst2 0 (* a indexação começa do 0 *)
let nth2 = List.nth lst4 3
    
(* Já existem funções de alta ordem definidas na linguagem para listas *)

let map1 = List.map (fun x -> x+3) lst1
let filt1 = List.filter (fun x -> x mod 3 = 0) lst2
let filt2 = List.filter (fun x -> x = true) lst3
let filt4 = List.filter (fun x -> x >= 'h') lst4
let filt5 = List.filter (fun x -> x >= 'h') lst6

let mapex1 = List.map (fun x -> x+3) [1;2;3]
let filtex1 = List.filter (fun x -> x >= 'h') ['z';'a';'g';'k';'p']
    
(* Matrizes - array *)
let mat1 = [|1;2;3|]
let mat2 = [|true;false|]
let mat3 = [|[1;2;3];[4;5;6];[7;8;9]|]
           
(* Para acessar um item de uma matriz *)
let item1mat = mat3.(1) (* retorna o segundo item da matriz *)           


(* Exceções - exn *)
exception BugHere
let exp1:exn = Not_found
    (* Para levantar a excessão basta chamar o comando "raise"
       raise BugHere
*)

(* Funções - fun*)
let fn1 = (fun n->n+1) 
let fn2 = (fun (k:int):bool -> true)
(* *)

(***  Variáveis e Funções  ***)

(* São declaradas através da keyword "let"
   Devem começar por um caractere alfabético minúsculo
*)

(* Utilizando através do Try Ocaml a separação ";;" é opcional *)

let x = 10
  
let func1 = x*2;; 

(* Permite a utilização de ' para diferenciar nomes de variaveis e funções *)
let x'=15+3

(* O compilador Ocaml consegue inferir tipos automaticamente, portanto não é 
necessário a especificação explicita dos tipos dos argumentos. Porém, pode ser
feito se o programador quiser ou precisar.
*)

let dobro (numero: int): int = numero * 2
let inc1 (numero) = numero + 1 
  
(* Funcoes recursivas devem utilizar a keyword "rec" *)
let rec fatorial n = if n = 0 then 1 else n * fatorial(n-1)

(* Aplicação de funções só necessita de parênteses para seus argumentos caso
o argumento seja uma expressão*)
let fat3 = fatorial 3
let fat3' = fatorial(3)
let fat4 = fatorial (2+2)
let fat4' = fatorial (dobro 2)
    
(* Todas as funções em Ocaml devem ter pelo menos 1 argumento
Caso a função não tenha deve-se passar "()" (tipo "unit") como argumento
*)
let printHello () = print_endline "Hello World!"
    
(* Assim como em Haskell, fazer uma chamada de função com menos argumentos que 
os exigidos para executar a função completa não causa erro.
Essa chamada produzirá uma nova função.
*)
let soma (x:int) (y:int) = x+y

let inc10 = soma 10
    

(* Para utilizar Ocaml de uma forma mais próxima a um paradigma imperativo
no corpo da função pode-se utilizar diversas expressões,
sendo a última delas o valor de retorno.
*)

  (* Atenção: foo0 retorna um int, enquanto foo1 retorna um booleano.
        Sendo estes os tipos de retorno dessas funções! *)
  

let foo0 n =  print_endline "O dobro do número é: ";
  print_endline(string_of_int (dobro n));
  n+2 
 (* 
Em C esta mesma função poderia ser definida da seguinte forma:

int foo0(int n)
{
    int dobro = n*2;
    printf("O dobro do número é: %d", dobro);
    return (n+2);
}


*) 
    (* Utilizando Format *)
let foo1 n =  printf "O dobro de %d %s %d" n " é: " (dobro n);
  true (* Isso em uma linguagem C-like seria o mesmo que "return true;"*)
  
(* 
Em C++ esta mesma função poderia ser definida da seguinte forma:

bool foo1(int n){
    std::cout <<"\n O dobro de "<<n<<" é: "<<(n*2)<<"\n";
    return true;
}

*) 

let foo2 n =  printf "O dobro de %d %s %d" n " é: " (dobro n);
  () (* caso de retorno de tipo unit*)

(* As definições podem ser encadeadas através do comando "Let ... in"*)
let div1 = let x = 21 in
  let y = 3 in
  x/y ;;


(* Funções anônimas *)
(* Como linguagem funcional Ocaml também se utiliza de funções lambda *)
let lambda1 = fun x -> x*x
let resl1 = lambda1 10
    
let resFnAnonima = (fun y -> (y+2)*y) 8


(*** Tipos de dados definidos pelo usuário ***)

(* Podemos definir um novo tipo através da construção:
    "type <nome do tipo> = "*)

type tipo =
    TyInt
  | TyBool
  | TyFn of tipo * tipo
  | TyPair of tipo * tipo

type ident = string

type op =
    Sum
  | Sub 
  | Mult
  | Eq
  | Gt
  | Lt
  | Geq
  | Leq
    
type expr =
  | Num of int
  | Var of ident
  | True
  | False
  | Binop of op * expr * expr
  | Pair of expr * expr
  | Fst of expr
  | Snd of expr
  | If of expr * expr * expr
  | Fn of ident * tipo * expr
  | App of expr * expr
  | Let of ident * tipo * expr * expr
  | LetRec of ident * tipo * expr  * expr 
              
type valor =
    VNum of int
  | VTrue
  | VFalse
  | VPair of valor * valor
  | VClos  of ident * expr * renv
  | VRclos of ident * ident * expr * renv 
and 
  renv = (ident * valor) 

(* Tipos podem ser parametrizados, sendo mostrado como "'a" *)
let foo4 arg = true 



(*** Pattern Matching ***)

(* 
Similar ao switch-case de linguagens imperativas como o C
*)

let rec somaLista l = 
  match l with
    [] -> 0
  | head::tl -> head + (somaLista tl)
                       

let exls1 = [12;15;3;2] (* soma -> 32*)
let exls2 = [1;2;3;4;5;6;7] (* soma -> 28*)
let sumExls1 = somaLista exls1
let sumExls2 = somaLista exls2


(* Funções de alta ordem - Map *)   
    (* Função para mapear uma função sobre uma lista *)
let rec myMap fn l= 
  match l with
    [] -> []
  | head::tail -> (fn head) :: myMap fn tail 
  
(* Função que soma 1 a todos os elementos de uma lista
A função de somar 1 já existe neste arquivo definida como "inc1"
*)                    
let soma1Lista l = myMap inc1 l
    
let resSL1 = soma1Lista exls1
let resSL2 = soma1Lista exls2

    



  (* *)