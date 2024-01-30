CIRCUIT : SYSTEME DE COMPTAGE DE PERSONNES

			AUTEUR : DODO MAMANE ABARI
			DATE       : 2019-2020
			ECOLE     :ENSAF
			CIRCUIT NUMERIQUE: SYSTEME DE COMPTAGE DE PERSONNES

ELEMENTS A UTILISER AVEC LE CIRCUIT:
-2 afficheurs 7 segments
-un capteur de detection de présence des personnes donc le signal est numérisé.
-un clavier composée de 10 touches (0 à 9) donc la srtie est codée sur 10 bits.

LES ENTREE DU CIRCUIT: 
 	- timer est le signal qui permet de demarrer le circuit 
		 timer=1 donc le circuit est en fonctionnement 
	 	timer=0 donc le circuit est en arrêt
	        Il peut correspondre à une touche ou à un switch qu'on met à 1 lorsquón ouvre le local
	        et à 0 lorsqu'on ferme le local
	-indicateur: lorsque le nombre maximal est atteint pour continuer à recevoir des personnes 
	 au  sein du local on doit mettre indicateur à 1. Cela permet aux gestionnaires du local de le
	 desinfecter en cas de besoin.
	       Il peut correspondre à une touche ou à un switch qu'on met à l'état 1 lorsqu'on veut 
	       continuer à zero à tout moment.
	
	-pwm_sig : Il permet l'incrémentation du compteur du circuit lorsqu'il est à l'état 1. 
	                     Il provient du capteur.
	- clk : horloge 
	- rst: reset (mettre le circuit à l'état initial)
	-data : correspond à la donnée sur 10 bits tapée à l'écran qui fiche le nombre maximal autorisé.
LES  SORTIES
	-Afficheur 1: max_nb      =nombre maximal autorisé
	-Afficheur 2: current_nb = nombre des personnes à l'intérieur du local en temps réel.
	-jour1          :le nombre des personnes ayant visité le local la journée.
	-jour2          :le nombre des personnes ayant visité la veille le local.


FONCTIONNEMENT: 
    Le circuit est mis en fonctionnement lorsque le signal timer(correspondant à l'ouverture et à la fermeture du local) 
est à son niveau haut.Ainsi le nombre maximal des personnes autorisé à y entrer est fixé d'avance à partir d'un clavier.
La detection des personnes est faite par l'utilisation d'un capteur qui permet d'incrementer un compteur à chaque detection.
La valeur du compteur est affiché à l'aide d'un afficheur sept segments, ce qui permet d'indiquer exactement le nombre des personnes 
à l'intérieur du local à ceux qui sont à l'extérieur.
    Une fois le nombre des personnes maximal atteint le compteur es remis à zero lorsque le signal indicateur est à son état haut.
A la fermeture du local(timer=0) le nombre des personnes ayant visité le local est stocké dans une mémoire (cette mémoire stocke le nombre des 
personnes sur deux jours). 
                                     REMARQUE: ICI ON S'INTERESSE UNIQUEMENT AUX PERSONNES ENTRANT DANS LE  LOCAL ET NON SORTANT DU LOCAL.(PAS DE DECREMENTATION DU COMPTEUR).