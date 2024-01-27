// import { v4 as uuidv4 } from 'uuid';

type Agent = {
	// uuid: typeof uuidv4;
	uuid: string;
	codename: string;
};

let agents: Agent[] = [
	{
		uuid: 'aaa',
		codename: 'A'
	},
	{
		uuid: 'bbb',
		codename: 'B'
	}
];

export function getAgents() {
	return agents;
}

export function addAgent(uuid: string, codename: string) {
	const agent: Agent = {
		uuid: uuid,
		codename: codename
	};
	agents.push(agent);
}

export function removeTodo(uuid: string) {
	agents = agents.filter((agent) => agent.uuid !== uuid);
}

export function clearTodos() {
	agents = [];
}
