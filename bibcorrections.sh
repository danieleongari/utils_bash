#!/bin/bash

inpbib=$1

cp $inpbib ${inpbib}_old

#sed -i "s/TOFIND/TOREPLACE/I" $inpbib            # (-i) substitute file, (/I) case insensitive 
#sed -i "s///I" $inpbib

if true; then  #correct accents
sed -i "s/ń/\\\'{n}/" $inpbib
fi


if true; then  
#(0) Journal abbreviations from http://cassi.cas.org/search.jsp
#(1) Find is case insensitive
#(2) If thee are several different "common" version, write them all. The longest should go first to avoid replacement conflicts.
sed -i "s/nature materials/Nat. Mat./I" $inpbib
sed -i "s/nature review/Nat. Rev./I" $inpbib
sed -i "s/nature chemistry/Nat. Chem./I" $inpbib
sed -i "s/Journal of the American Chemical society/J. Am. Chem. Soc./I" $inpbib
sed -i "s/langmuir/Langmuir/I" $inpbib
sed -i "s/the journal of physical chemistry/J. Phys. Chem./I" $inpbib
sed -i "s/chemical communications/Chem. Comm./I" $inpbib
sed -i "s/Chemical Society Reviews/Chem. Soc. Rev./I" $inpbib
sed -i "s/Angewandte Chemie International Edition/Angew. Chem., Int. Ed./I" $inpbib
sed -i "s/science/Science/I" $inpbib
sed -i "s/Chemical reviews/Chem. Rev./I" $inpbib
sed -i "s/Journal of Applied Crystallography/J. Appl. Crystallogr./I" $inpbib
sed -i "s/Molecular Simulation/Mol. Simul./I" $inpbib
sed -i "s/Microporous and Mesoporous Materials/Microporous Mesoporous Mater./I" $inpbib
sed -i "s/Physical review letters/Phys. Rev. Lett./I" $inpbib
sed -i "s/Physical Review/Phys. Rev./I" $inpbib
sed -i "s/The International Journal of High Performance Computing Applications/Int. J. High Perform. Comput. Appl./I" $inpbib
sed -i "s/Chemical Engineering Science/Chem. Eng. Sci./I" $inpbib
sed -i "s/Chemistry of Materials/Chem. Mater./I" $inpbib
sed -i "s/Acta Crystallographica Section B: Structural Science, Crystal Engineering and Materials/Acta Crystallogr., Sect. B: Struct. Sci., Cryst. Eng. Mater./I" $inpbib
sed -i "s/Pure and applied chemistry/Pure Appl. Chem./I" $inpbib
sed -i "s/Chemical Science/Chem. Sci./I" $inpbib
sed -i 's/Industrial \\& Engineering Chemistry Research/Ind. Eng. Chem. Res./I' $inpbib
sed -i "s/Industrial & Engineering Chemistry Research/Ind. Eng. Chem. Res./I" $inpbib
sed -i "s/Chemistry--A European Journal/Chem. Eur. J./I" $inpbib
sed -i "s/Chemistry-A European Journal/Chem. Eur. J./I" $inpbib
sed -i "s/Chemistry: A European Journal/Chem. Eur. J./I" $inpbib
sed -i 's/Energy \\& Environmental Science/Energy Environ. Sci./I' $inpbib
sed -i "s/Journal of the Chemical Society, Dalton Transactions/Dalton Trans./I" $inpbib
sed -i "s/Dalton Transactions/Dalton Trans./I" $inpbib
sed -i 's/Crystal Growth \& Design/Cryst. Growth Des./I' $inpbib
sed -i "s/Colloids and Surfaces A: Physicochemical and Engineering Aspects/Colloids Surf., A/I" $inpbib
sed -i "s/Journal of chemical theory and computation/J. Chem. Theory Comput./I" $inpbib
sed -i "s/Studies in Surface Science and Catalysis/Stud. Surf. Sci. Catal./I" $inpbib
sed -i "s/Journal of the Physical Chemical Society of Russia/J. Phys. Chem. Soc. Russ./I" $inpbib
fi


if false; then #debug
mv   ${inpbib}      ${inpbib}_new
mv   ${inpbib}_old  ${inpbib}
more ${inpbib}      ${inpbib}_new
fi
