pragma circom 2.0.0;

template binaryCheck () {
   //Declaration of signals.
   signal input in;
   signal output out;

   //Statements.
   in * (in-1) === 0;
   out <== in;
}
template Multiplier2(){
   //Declaration of signals
   signal input in1;
   signal input in2;
   signal output out;

   //Statements.
   out <== in1 * in2;
}

template And2(){
   //Declaration of signals and components.
   signal input in1;
   signal input in2;
   signal output out;
   component mult = Multiplier2();
   component binCheck[2];

   //Statements.
   binCheck[0] = binaryCheck();
   binCheck[0].in <== in1;
   binCheck[1] = binaryCheck();
   binCheck[1].in <== in2;
   mult.in1 <== binCheck[0].out;
   mult.in2 <== binCheck[1].out;
   out <== mult.out;
}

template Not() {
   //Declaration of signals and components
   signal input in1;
   signal output out;

   out <== 1 - in1;

}

template Or2(){
   // Declaration of signals and components
   signal input in1;
   signal input in2;
   signal output out;

   out <== in1 + in2 - in1 * in2;
}

template Mainer2(){
   // Declaration of signals and components
   signal input in1;
   signal input in2;
   signal output out;
   component ander = And2();
   component orer = Or2();
   component noter = Not();
   //and and not values
   ander.in1 <== in1;
   ander.in2 <== in2;
   noter.in1 <== in2;
   orer.in1 <== ander.out;
   orer.in2 <== noter.out;
   out <== orer.out;

}
component main = Mainer2();