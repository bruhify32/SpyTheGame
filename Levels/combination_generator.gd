extends Node;

func generate_combination(length):
	var combination : Array = [];
	for number in range(length):
		combination.append(randi()%10);
	return combination;
	
