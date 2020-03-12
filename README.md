# solidity-market-moc

## process

Buyer => 
front :

1) regarder les produits disponibles
2) choisir le produit qui veut
3) si sa lui plait il va envoyer une requête au smartcontract

smartcontract :

achat :

1) recevoir et alimenter les infos du buyer et du seller
2) buyer acheter le produit
3) vérifier si la somme qui met est égale à la somme qui l'envoie
4) l'argent du buyer est envoyé au seller et on retire le produit de la liste

mise en vente :

1) seller qui pourra ajouter des produits
