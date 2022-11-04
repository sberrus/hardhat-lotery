// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// RAFFLE

// requisitos:

// poder participar en la loteria.
// seleccionar un ganador aleatoreamente (usando oracle chainlink randomness).
// los ganadores van a ser seleccionados cada cierta cantidad de tiempo.
// poder tener un controlador que permita activar y desactivar la loteria.

error Raffle__NotEnoughtEthEntered();

contract Raffle {
	uint256 private immutable i_entranceFee;
	address payable[] private s_players;

	// {i_*} se usa para declarar una variable immutable.
	// las variables immutables se deben inicializar en el constructor.
	// No confundir con las variables

	constructor(uint256 entranceFee) {
		i_entranceFee = entranceFee;
	}

	// Funcion para poder participar en la rifa
	function enterRaffle() public payable {
		// verificar si el wie enviado es suficiente.
		if (msg.value < i_entranceFee) {
			revert Raffle__NotEnoughtEthEntered();
		}

		s_players.push(payable(msg.sender));
	}

	// function pickRandomWinner() {}

	// GETERS
	function getEntranceFee() public view returns (uint256) {
		return i_entranceFee;
	}

	function getPlayer(uint256 index) public view returns (address) {
		return s_players[index];
	}
}