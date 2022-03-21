library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity turkey_shoot_prog1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of turkey_shoot_prog1 is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"43",X"4F",X"50",X"59",X"52",X"49",X"47",X"48",X"54",X"20",X"28",X"43",X"29",X"20",X"31",X"39",
		X"38",X"34",X"2C",X"20",X"57",X"49",X"4C",X"4C",X"49",X"41",X"4D",X"53",X"20",X"45",X"4C",X"45",
		X"43",X"54",X"52",X"4F",X"4E",X"49",X"43",X"53",X"20",X"49",X"4E",X"43",X"2E",X"34",X"03",X"86",
		X"0B",X"20",X"04",X"34",X"03",X"86",X"54",X"1A",X"50",X"F7",X"C8",X"81",X"C6",X"00",X"F7",X"C8",
		X"00",X"F6",X"A5",X"CA",X"FD",X"C8",X"82",X"FD",X"C8",X"84",X"40",X"8B",X"8E",X"C6",X"05",X"FD",
		X"C8",X"86",X"C6",X"1F",X"F7",X"C8",X"80",X"86",X"06",X"B7",X"C8",X"00",X"35",X"83",X"34",X"40",
		X"97",X"DB",X"CC",X"00",X"32",X"8E",X"00",X"00",X"1F",X"12",X"BD",X"63",X"61",X"CC",X"00",X"80",
		X"ED",X"44",X"96",X"DB",X"A7",X"C8",X"34",X"35",X"C0",X"86",X"B4",X"E6",X"C8",X"34",X"C1",X"03",
		X"26",X"02",X"86",X"1E",X"A7",X"C8",X"3A",X"CC",X"01",X"01",X"ED",X"C8",X"35",X"ED",X"C8",X"37",
		X"A7",X"C8",X"39",X"A6",X"C8",X"34",X"81",X"0C",X"27",X"10",X"81",X"10",X"27",X"0C",X"81",X"0D",
		X"27",X"04",X"81",X"11",X"26",X"06",X"86",X"09",X"20",X"02",X"86",X"08",X"4A",X"C6",X"05",X"E7",
		X"C8",X"46",X"3D",X"58",X"8E",X"D1",X"6A",X"3A",X"31",X"C8",X"3C",X"C6",X"05",X"34",X"04",X"EC",
		X"81",X"ED",X"A1",X"6A",X"E4",X"26",X"F8",X"35",X"04",X"8E",X"70",X"7D",X"BD",X"6F",X"D3",X"8E",
		X"D0",X"D5",X"AF",X"4A",X"39",X"6A",X"C8",X"3A",X"26",X"04",X"BD",X"F9",X"12",X"39",X"A6",X"C8",
		X"46",X"4A",X"2A",X"02",X"86",X"04",X"A7",X"C8",X"46",X"30",X"C8",X"35",X"30",X"86",X"6A",X"84",
		X"26",X"0E",X"48",X"31",X"C8",X"3C",X"34",X"40",X"EE",X"A6",X"27",X"02",X"8D",X"03",X"35",X"40",
		X"39",X"37",X"04",X"E7",X"84",X"37",X"10",X"AF",X"A6",X"37",X"30",X"CC",X"03",X"06",X"B7",X"C8",
		X"00",X"AF",X"A4",X"F7",X"C8",X"00",X"39",X"96",X"DC",X"27",X"01",X"39",X"B6",X"B0",X"64",X"26",
		X"1F",X"B6",X"A6",X"D4",X"4A",X"2A",X"02",X"86",X"13",X"B7",X"A6",X"D4",X"8E",X"A6",X"98",X"30",
		X"86",X"6A",X"84",X"26",X"0B",X"48",X"10",X"8E",X"A6",X"AC",X"EE",X"A6",X"27",X"02",X"8D",X"C1",
		X"39",X"86",X"38",X"BD",X"E0",X"3E",X"8E",X"A6",X"98",X"CE",X"D1",X"C4",X"C6",X"13",X"A6",X"C5",
		X"8B",X"12",X"A7",X"85",X"5A",X"2A",X"F7",X"CE",X"D1",X"D8",X"10",X"8E",X"A6",X"AC",X"8E",X"00",
		X"28",X"BD",X"7F",X"33",X"86",X"14",X"B7",X"A6",X"D4",X"39",X"D2",X"FC",X"D3",X"73",X"D3",X"03",
		X"00",X"00",X"00",X"00",X"D3",X"11",X"D3",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"D2",X"70",
		X"D3",X"2D",X"00",X"00",X"00",X"00",X"00",X"00",X"D3",X"81",X"D3",X"3B",X"D2",X"FC",X"00",X"00",
		X"00",X"00",X"D2",X"46",X"D2",X"62",X"D3",X"49",X"00",X"00",X"00",X"00",X"D3",X"8F",X"D3",X"9D",
		X"D3",X"AB",X"D3",X"B9",X"D3",X"57",X"D2",X"D2",X"D2",X"E0",X"D2",X"EE",X"D3",X"65",X"00",X"00",
		X"D3",X"C7",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"D3",X"D5",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"08",X"0C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"D2",X"00",X"D2",X"0E",X"D2",X"1C",X"D2",X"2A",
		X"D2",X"38",X"D2",X"46",X"D2",X"62",X"D2",X"70",X"D2",X"7E",X"D2",X"8C",X"D2",X"9A",X"D2",X"A8",
		X"D2",X"B6",X"D2",X"C4",X"D2",X"D2",X"D2",X"E0",X"D2",X"EE",X"00",X"00",X"00",X"00",X"00",X"00",
		X"06",X"D2",X"07",X"00",X"00",X"87",X"02",X"06",X"D2",X"00",X"FF",X"FA",X"87",X"02",X"06",X"D2",
		X"15",X"00",X"00",X"87",X"06",X"06",X"D2",X"0E",X"0F",X"DD",X"87",X"06",X"02",X"D2",X"23",X"00",
		X"00",X"87",X"36",X"02",X"D2",X"1C",X"0F",X"C0",X"87",X"36",X"02",X"D2",X"31",X"0F",X"C0",X"87",
		X"22",X"02",X"D2",X"2A",X"00",X"00",X"87",X"22",X"0C",X"D2",X"3F",X"00",X"00",X"87",X"08",X"01",
		X"D2",X"38",X"ED",X"FE",X"87",X"08",X"02",X"D2",X"4D",X"00",X"00",X"87",X"26",X"02",X"D2",X"54",
		X"EC",X"AF",X"87",X"26",X"02",X"D2",X"5B",X"EC",X"CF",X"87",X"26",X"02",X"D2",X"46",X"EC",X"EF",
		X"87",X"26",X"02",X"D2",X"69",X"00",X"00",X"87",X"20",X"02",X"D2",X"62",X"0E",X"F0",X"87",X"20",
		X"04",X"D2",X"77",X"ED",X"FE",X"87",X"2A",X"02",X"D2",X"70",X"00",X"00",X"87",X"2A",X"10",X"D2",
		X"85",X"0F",X"88",X"87",X"4A",X"14",X"D2",X"7E",X"0F",X"F8",X"87",X"4A",X"10",X"D2",X"93",X"0F",
		X"88",X"87",X"48",X"14",X"D2",X"8C",X"0F",X"F8",X"87",X"48",X"10",X"D2",X"A1",X"0F",X"88",X"87",
		X"46",X"14",X"D2",X"9A",X"0F",X"F8",X"87",X"46",X"10",X"D2",X"AF",X"0F",X"88",X"87",X"56",X"14",
		X"D2",X"A8",X"0F",X"F8",X"87",X"56",X"03",X"D2",X"BD",X"F3",X"60",X"87",X"6A",X"03",X"D2",X"B6",
		X"F3",X"E0",X"87",X"6A",X"03",X"D2",X"CB",X"FE",X"60",X"87",X"66",X"03",X"D2",X"C4",X"FE",X"F0",
		X"87",X"66",X"01",X"D2",X"D9",X"00",X"00",X"87",X"60",X"06",X"D2",X"D2",X"E0",X"EF",X"87",X"60",
		X"02",X"D2",X"E7",X"00",X"00",X"87",X"62",X"05",X"D2",X"E0",X"0C",X"EF",X"87",X"62",X"03",X"D2",
		X"F5",X"00",X"00",X"87",X"68",X"04",X"D2",X"EE",X"0F",X"FF",X"87",X"68",X"FF",X"D2",X"FC",X"FF",
		X"FA",X"87",X"02",X"01",X"D3",X"0A",X"EE",X"F0",X"87",X"28",X"01",X"D3",X"03",X"EE",X"60",X"87",
		X"28",X"02",X"D3",X"18",X"F9",X"FD",X"87",X"36",X"02",X"D3",X"11",X"0F",X"F0",X"87",X"36",X"02",
		X"D3",X"26",X"0F",X"F0",X"87",X"22",X"02",X"D3",X"1F",X"F9",X"FD",X"87",X"22",X"01",X"D3",X"34",
		X"FF",X"FF",X"87",X"2A",X"01",X"D3",X"2D",X"00",X"00",X"87",X"2A",X"01",X"D3",X"42",X"EE",X"F0",
		X"87",X"00",X"01",X"D3",X"3B",X"00",X"00",X"87",X"00",X"01",X"D3",X"50",X"EE",X"F0",X"87",X"0A",
		X"01",X"D3",X"49",X"EE",X"60",X"87",X"0A",X"01",X"D3",X"5E",X"EE",X"F0",X"87",X"A8",X"01",X"D3",
		X"57",X"EE",X"60",X"87",X"A8",X"01",X"D3",X"6C",X"EE",X"F0",X"87",X"A2",X"01",X"D3",X"65",X"EE",
		X"60",X"87",X"A2",X"01",X"D3",X"7A",X"00",X"00",X"87",X"06",X"01",X"D3",X"73",X"0F",X"DD",X"87",
		X"06",X"02",X"D3",X"88",X"00",X"00",X"87",X"08",X"02",X"D3",X"81",X"ED",X"FE",X"87",X"08",X"04",
		X"D3",X"96",X"0F",X"F8",X"87",X"4A",X"04",X"D3",X"8F",X"0F",X"88",X"87",X"4A",X"04",X"D3",X"A4",
		X"0F",X"F8",X"87",X"48",X"04",X"D3",X"9D",X"0F",X"88",X"87",X"48",X"04",X"D3",X"B2",X"0F",X"F8",
		X"87",X"46",X"04",X"D3",X"AB",X"0F",X"88",X"87",X"46",X"04",X"D3",X"C0",X"0F",X"F8",X"87",X"56",
		X"04",X"D3",X"B9",X"0F",X"88",X"87",X"56",X"04",X"D3",X"CE",X"F3",X"E0",X"87",X"6A",X"04",X"D3",
		X"C7",X"FF",X"FF",X"87",X"6A",X"04",X"D3",X"DC",X"FE",X"F0",X"87",X"66",X"04",X"D3",X"D5",X"FF",
		X"FF",X"87",X"66",X"1A",X"50",X"10",X"CE",X"BF",X"00",X"5F",X"BD",X"E5",X"61",X"1C",X"AF",X"BD",
		X"4A",X"17",X"BD",X"54",X"CF",X"CC",X"00",X"00",X"DD",X"10",X"BD",X"4E",X"F9",X"BD",X"0A",X"B3",
		X"20",X"ED",X"1A",X"50",X"10",X"CE",X"BF",X"00",X"C6",X"00",X"BD",X"E5",X"61",X"BD",X"E0",X"EC",
		X"BD",X"E1",X"10",X"BD",X"7E",X"99",X"8D",X"40",X"BD",X"F0",X"6B",X"86",X"FF",X"97",X"40",X"97",
		X"DC",X"97",X"8F",X"B4",X"A9",X"18",X"97",X"9D",X"BD",X"E2",X"1C",X"86",X"FF",X"97",X"99",X"8E",
		X"70",X"4D",X"BD",X"6F",X"D3",X"1C",X"AF",X"BD",X"39",X"73",X"C6",X"FE",X"BD",X"E5",X"61",X"BD",
		X"D1",X"41",X"BD",X"E2",X"29",X"20",X"1E",X"DC",X"E1",X"C1",X"08",X"26",X"02",X"86",X"0D",X"8E",
		X"D5",X"21",X"1F",X"89",X"3A",X"3A",X"3A",X"39",X"96",X"9F",X"27",X"05",X"BD",X"DB",X"2D",X"0F",
		X"9F",X"39",X"BD",X"7B",X"D1",X"BD",X"E5",X"3D",X"BD",X"53",X"FB",X"BD",X"ED",X"71",X"96",X"8F",
		X"27",X"0F",X"8D",X"D3",X"A6",X"84",X"BD",X"66",X"BC",X"AE",X"01",X"CE",X"E3",X"2E",X"BD",X"33",
		X"2B",X"BD",X"7B",X"EA",X"BD",X"7C",X"08",X"BD",X"4E",X"F9",X"0F",X"40",X"0F",X"96",X"BD",X"34",
		X"74",X"BD",X"39",X"AD",X"BD",X"E2",X"06",X"BD",X"43",X"5B",X"0F",X"38",X"0F",X"DC",X"0F",X"8F",
		X"0F",X"71",X"0F",X"9A",X"BD",X"E5",X"1F",X"BD",X"34",X"74",X"96",X"40",X"27",X"27",X"BD",X"7B",
		X"8E",X"BD",X"33",X"46",X"0C",X"8F",X"BD",X"E0",X"EC",X"0F",X"A9",X"96",X"E4",X"27",X"04",X"0F",
		X"40",X"20",X"9F",X"96",X"00",X"BA",X"BB",X"B9",X"26",X"98",X"0F",X"40",X"BD",X"DB",X"7B",X"BD",
		X"E7",X"2F",X"7E",X"D3",X"EF",X"96",X"38",X"27",X"2B",X"96",X"11",X"81",X"64",X"25",X"0B",X"BD",
		X"7A",X"A6",X"0F",X"00",X"0F",X"38",X"03",X"40",X"20",X"C7",X"BD",X"7A",X"A6",X"96",X"E2",X"81",
		X"07",X"27",X"04",X"81",X"08",X"26",X"08",X"BD",X"33",X"46",X"BD",X"E0",X"EC",X"0C",X"8F",X"0F",
		X"A9",X"7E",X"D4",X"62",X"BD",X"E5",X"1F",X"20",X"9E",X"86",X"00",X"BD",X"E5",X"61",X"BD",X"E0",
		X"EC",X"BD",X"E1",X"10",X"BD",X"70",X"28",X"3F",X"10",X"CE",X"BF",X"00",X"1C",X"AF",X"7E",X"D3",
		X"F5",X"01",X"70",X"00",X"04",X"73",X"00",X"03",X"72",X"00",X"01",X"70",X"00",X"04",X"73",X"00",
		X"03",X"72",X"00",X"01",X"70",X"00",X"04",X"73",X"00",X"03",X"72",X"00",X"01",X"70",X"00",X"04",
		X"73",X"00",X"03",X"72",X"00",X"01",X"70",X"00",X"02",X"71",X"00",X"B6",X"C9",X"80",X"84",X"7A",
		X"1F",X"89",X"53",X"94",X"A5",X"85",X"7A",X"27",X"2A",X"D7",X"A5",X"D6",X"47",X"26",X"23",X"85",
		X"02",X"26",X"31",X"C6",X"1F",X"85",X"40",X"26",X"17",X"85",X"08",X"26",X"0A",X"85",X"20",X"26",
		X"0C",X"7C",X"CF",X"13",X"D7",X"47",X"39",X"7C",X"CF",X"12",X"D7",X"47",X"39",X"7C",X"CF",X"14",
		X"D7",X"47",X"39",X"D7",X"A5",X"39",X"B6",X"C9",X"80",X"84",X"7A",X"1F",X"89",X"53",X"94",X"A5",
		X"85",X"02",X"27",X"04",X"86",X"FF",X"97",X"60",X"D7",X"A5",X"D6",X"B5",X"27",X"02",X"0A",X"B5",
		X"39",X"CE",X"D6",X"92",X"8D",X"13",X"39",X"CE",X"D6",X"BC",X"8D",X"0D",X"39",X"CE",X"D6",X"E6",
		X"8D",X"07",X"39",X"CE",X"D7",X"10",X"8D",X"01",X"39",X"37",X"30",X"D6",X"8C",X"26",X"21",X"33",
		X"42",X"F6",X"A9",X"43",X"27",X"1A",X"BD",X"F4",X"87",X"4F",X"BD",X"65",X"F9",X"8E",X"A6",X"02",
		X"BD",X"66",X"1A",X"86",X"FF",X"A7",X"84",X"AE",X"42",X"AD",X"A4",X"AE",X"44",X"AD",X"A4",X"39",
		X"0A",X"53",X"2E",X"10",X"86",X"05",X"97",X"53",X"03",X"54",X"2A",X"04",X"BD",X"F4",X"87",X"39",
		X"AE",X"C4",X"AD",X"A4",X"39",X"F6",X"A9",X"08",X"CE",X"CF",X"12",X"8E",X"A9",X"1B",X"8D",X"17",
		X"F6",X"A9",X"0A",X"CE",X"CF",X"13",X"8E",X"A9",X"1E",X"8D",X"0C",X"F6",X"A9",X"0C",X"CE",X"CF",
		X"14",X"8E",X"A9",X"21",X"8D",X"01",X"39",X"A6",X"C4",X"84",X"0F",X"27",X"5C",X"6A",X"C4",X"86",
		X"01",X"BD",X"7E",X"EA",X"34",X"04",X"FB",X"AA",X"60",X"F7",X"AA",X"60",X"F6",X"A9",X"3C",X"EB",
		X"E0",X"F7",X"A9",X"3C",X"F1",X"A9",X"12",X"25",X"2B",X"F6",X"A9",X"10",X"27",X"12",X"F6",X"AA",
		X"60",X"F0",X"A9",X"10",X"25",X"0A",X"BD",X"00",X"B5",X"F7",X"AA",X"60",X"8D",X"2C",X"20",X"EE",
		X"F6",X"A9",X"0E",X"27",X"0F",X"F6",X"A9",X"3C",X"F0",X"A9",X"0E",X"25",X"07",X"F7",X"A9",X"3C",
		X"8D",X"18",X"20",X"F1",X"BD",X"DA",X"7F",X"96",X"AE",X"81",X"FF",X"26",X"06",X"86",X"04",X"BD",
		X"70",X"0E",X"39",X"8E",X"70",X"55",X"BD",X"6F",X"D3",X"39",X"B6",X"A9",X"43",X"4C",X"81",X"27",
		X"22",X"0F",X"B7",X"A9",X"43",X"96",X"8C",X"26",X"08",X"86",X"01",X"8E",X"A9",X"24",X"BD",X"7E",
		X"EA",X"39",X"D6",X"9E",X"F5",X"42",X"D6",X"A4",X"D6",X"AA",X"D6",X"B0",X"D6",X"B6",X"00",X"00",
		X"71",X"B1",X"22",X"0C",X"D7",X"46",X"00",X"77",X"B4",X"44",X"D7",X"3A",X"00",X"71",X"B4",X"44",
		X"D7",X"51",X"00",X"74",X"B4",X"44",X"A6",X"02",X"00",X"A4",X"B4",X"44",X"D6",X"C8",X"F5",X"4F",
		X"D6",X"CE",X"D6",X"D4",X"D6",X"DA",X"D6",X"E0",X"00",X"00",X"7C",X"E4",X"16",X"05",X"D7",X"46",
		X"00",X"80",X"E4",X"11",X"D7",X"3A",X"00",X"7C",X"E4",X"11",X"D7",X"51",X"00",X"7E",X"E4",X"11",
		X"A6",X"02",X"00",X"9E",X"E4",X"11",X"D6",X"F2",X"F5",X"4F",X"D6",X"F8",X"D6",X"FE",X"D7",X"04",
		X"D7",X"0A",X"00",X"00",X"7C",X"EE",X"16",X"07",X"D7",X"46",X"00",X"80",X"EF",X"66",X"D7",X"3A",
		X"00",X"7C",X"EF",X"66",X"D7",X"51",X"00",X"7E",X"EF",X"66",X"A6",X"02",X"00",X"9E",X"EF",X"66",
		X"D7",X"1C",X"F5",X"4F",X"D7",X"22",X"D7",X"28",X"D7",X"2E",X"D7",X"34",X"00",X"00",X"7C",X"EE",
		X"16",X"07",X"D7",X"46",X"00",X"80",X"EF",X"11",X"D7",X"3A",X"00",X"7C",X"EF",X"11",X"D7",X"51",
		X"00",X"7E",X"EF",X"11",X"A6",X"02",X"00",X"9E",X"EF",X"11",X"49",X"4E",X"53",X"45",X"52",X"54",
		X"20",X"43",X"4F",X"49",X"4E",X"FF",X"46",X"52",X"45",X"45",X"20",X"50",X"4C",X"41",X"59",X"21",
		X"FF",X"43",X"52",X"45",X"44",X"49",X"54",X"53",X"20",X"FF",X"4F",X"BD",X"E0",X"2D",X"BD",X"E0",
		X"E5",X"BD",X"D8",X"61",X"0F",X"60",X"CE",X"3F",X"00",X"8E",X"D7",X"98",X"20",X"17",X"8E",X"D7",
		X"98",X"F6",X"C9",X"80",X"C5",X"01",X"27",X"14",X"BD",X"E0",X"4F",X"1E",X"03",X"4C",X"84",X"3F",
		X"BD",X"E0",X"2D",X"1E",X"03",X"EC",X"81",X"27",X"E5",X"BD",X"E0",X"5A",X"86",X"3C",X"BD",X"EE",
		X"83",X"27",X"DE",X"4F",X"BD",X"E0",X"2D",X"39",X"FF",X"1F",X"FF",X"3F",X"FF",X"7F",X"FF",X"FF",
		X"01",X"F0",X"03",X"F0",X"07",X"F0",X"0F",X"F0",X"10",X"F0",X"30",X"F0",X"70",X"F0",X"F0",X"F0",
		X"00",X"F1",X"00",X"F3",X"00",X"F7",X"00",X"FF",X"00",X"00",X"DC",X"3B",X"A3",X"04",X"34",X"02",
		X"A6",X"06",X"3D",X"E3",X"02",X"EB",X"E0",X"89",X"00",X"83",X"00",X"01",X"FD",X"C8",X"82",X"CC",
		X"C5",X"85",X"FD",X"C8",X"84",X"CC",X"01",X"02",X"FD",X"C8",X"86",X"A6",X"88",X"1F",X"B7",X"C8",
		X"00",X"A6",X"00",X"84",X"20",X"B7",X"C8",X"80",X"86",X"06",X"B7",X"C8",X"00",X"B6",X"C5",X"86",
		X"94",X"72",X"39",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"43",X"4F",X"50",X"59",X"52",X"49",X"47",X"48",X"54",X"20",X"28",X"43",X"29",X"20",X"31",X"39",
		X"38",X"34",X"2C",X"20",X"57",X"49",X"4C",X"4C",X"49",X"41",X"4D",X"53",X"20",X"45",X"4C",X"45",
		X"43",X"54",X"52",X"4F",X"4E",X"49",X"43",X"53",X"20",X"49",X"4E",X"43",X"2E",X"BD",X"E0",X"E5",
		X"86",X"05",X"BD",X"E0",X"76",X"BD",X"D8",X"97",X"8D",X"20",X"4F",X"BD",X"E0",X"76",X"8D",X"21",
		X"CC",X"0F",X"F0",X"8D",X"12",X"CC",X"F0",X"F0",X"8D",X"0D",X"CC",X"00",X"FF",X"8D",X"08",X"86",
		X"05",X"BD",X"E0",X"76",X"8D",X"04",X"39",X"BD",X"E0",X"5A",X"0F",X"60",X"96",X"60",X"27",X"FC",
		X"39",X"34",X"11",X"1A",X"10",X"8E",X"C8",X"80",X"CE",X"D8",X"86",X"CC",X"09",X"FF",X"ED",X"06",
		X"6F",X"05",X"86",X"00",X"E6",X"C0",X"27",X"0C",X"E7",X"01",X"A7",X"04",X"C6",X"12",X"E7",X"00",
		X"8B",X"09",X"20",X"F0",X"35",X"91",X"11",X"11",X"22",X"33",X"44",X"55",X"66",X"77",X"88",X"99",
		X"AA",X"BB",X"CC",X"DD",X"EE",X"FF",X"00",X"34",X"11",X"1A",X"10",X"10",X"8E",X"D8",X"E5",X"8E",
		X"C8",X"80",X"EC",X"A1",X"27",X"1E",X"E7",X"01",X"C6",X"01",X"ED",X"06",X"33",X"04",X"EC",X"A1",
		X"85",X"02",X"27",X"04",X"E7",X"C0",X"20",X"02",X"E7",X"41",X"E6",X"A0",X"27",X"E4",X"E7",X"C4",
		X"A7",X"00",X"20",X"F6",X"CE",X"01",X"01",X"EF",X"06",X"CC",X"50",X"90",X"E7",X"01",X"CE",X"D9",
		X"4C",X"E6",X"C0",X"27",X"AF",X"E7",X"04",X"10",X"8E",X"D9",X"56",X"E6",X"A0",X"27",X"F2",X"E7",
		X"05",X"A7",X"00",X"20",X"F6",X"ED",X"90",X"50",X"09",X"03",X"13",X"22",X"32",X"41",X"00",X"ED",
		X"09",X"90",X"09",X"4F",X"5E",X"6E",X"7D",X"8D",X"00",X"8B",X"99",X"12",X"03",X"09",X"2A",X"4C",
		X"6E",X"92",X"B4",X"D6",X"F6",X"00",X"0D",X"11",X"12",X"42",X"07",X"08",X"F7",X"F8",X"00",X"0D",
		X"22",X"12",X"42",X"0A",X"0B",X"F4",X"F5",X"00",X"0D",X"77",X"12",X"42",X"09",X"F6",X"00",X"20",
		X"12",X"10",X"70",X"02",X"00",X"20",X"21",X"10",X"70",X"8E",X"00",X"20",X"77",X"10",X"70",X"03",
		X"8D",X"00",X"3E",X"55",X"12",X"03",X"80",X"00",X"3E",X"55",X"12",X"50",X"80",X"00",X"62",X"50",
		X"50",X"0C",X"48",X"00",X"61",X"50",X"50",X"93",X"48",X"00",X"00",X"00",X"0B",X"1B",X"2A",X"3A",
		X"48",X"57",X"66",X"76",X"85",X"00",X"1A",X"3B",X"5D",X"80",X"A3",X"C5",X"E6",X"00",X"0F",X"00",
		X"BD",X"E0",X"EF",X"BD",X"E1",X"10",X"8D",X"20",X"BD",X"E5",X"1F",X"0D",X"60",X"27",X"F9",X"39",
		X"86",X"FF",X"97",X"00",X"8D",X"12",X"81",X"40",X"27",X"0D",X"C6",X"10",X"86",X"03",X"BD",X"F3",
		X"32",X"26",X"04",X"5A",X"26",X"F6",X"5D",X"39",X"34",X"01",X"1A",X"50",X"0F",X"60",X"BD",X"DB",
		X"41",X"BD",X"27",X"27",X"27",X"0D",X"8E",X"DC",X"1A",X"BD",X"F5",X"42",X"8E",X"DC",X"20",X"86",
		X"30",X"20",X"09",X"86",X"40",X"0D",X"00",X"26",X"06",X"8E",X"DB",X"F8",X"BD",X"F5",X"42",X"B7",
		X"C9",X"8C",X"BD",X"DA",X"7F",X"BD",X"DA",X"A3",X"BD",X"DA",X"65",X"35",X"81",X"BD",X"DF",X"C4",
		X"BD",X"E0",X"EF",X"BD",X"E1",X"10",X"BD",X"DB",X"0B",X"BD",X"DB",X"41",X"7F",X"AA",X"63",X"7F",
		X"AA",X"64",X"CE",X"A9",X"1B",X"8E",X"00",X"29",X"BD",X"DA",X"58",X"A1",X"C4",X"27",X"0F",X"7F",
		X"A9",X"43",X"BD",X"DA",X"DF",X"8E",X"09",X"DB",X"BD",X"F5",X"42",X"7C",X"AA",X"63",X"CE",X"A9",
		X"45",X"8E",X"00",X"DE",X"BD",X"DA",X"58",X"A1",X"C4",X"27",X"0C",X"BD",X"DA",X"F8",X"8E",X"09",
		X"D5",X"BD",X"F5",X"42",X"7C",X"AA",X"63",X"CE",X"A9",X"00",X"8E",X"00",X"1A",X"BD",X"DA",X"58",
		X"A1",X"C4",X"27",X"25",X"BD",X"F3",X"66",X"26",X"08",X"BD",X"DA",X"CC",X"8E",X"09",X"E1",X"20",
		X"12",X"8E",X"F3",X"B9",X"BD",X"F5",X"42",X"8E",X"F3",X"BF",X"BD",X"F5",X"42",X"8E",X"F3",X"C5",
		X"7C",X"AA",X"64",X"BD",X"F5",X"42",X"7C",X"AA",X"63",X"7D",X"AA",X"63",X"27",X"11",X"BD",X"FA",
		X"E8",X"B6",X"C9",X"80",X"85",X"02",X"26",X"07",X"86",X"14",X"B7",X"C9",X"00",X"20",X"F2",X"7D",
		X"AA",X"64",X"27",X"03",X"BD",X"DA",X"CC",X"39",X"4F",X"86",X"01",X"34",X"10",X"A9",X"C0",X"30",
		X"1F",X"26",X"FA",X"35",X"90",X"34",X"76",X"CE",X"A9",X"00",X"8E",X"00",X"1A",X"8D",X"E9",X"A7",
		X"C4",X"CE",X"A9",X"00",X"10",X"8E",X"CC",X"00",X"8E",X"00",X"1B",X"8D",X"40",X"35",X"F6",X"34",
		X"76",X"B6",X"A9",X"43",X"81",X"27",X"23",X"03",X"7F",X"A9",X"43",X"CE",X"A9",X"1B",X"8E",X"00",
		X"29",X"8D",X"C5",X"A7",X"C4",X"CE",X"A9",X"1B",X"10",X"8E",X"CD",X"00",X"8E",X"00",X"2A",X"8D",
		X"1C",X"35",X"F6",X"34",X"76",X"CE",X"A9",X"45",X"8E",X"00",X"DE",X"8D",X"AB",X"A7",X"C4",X"CE",
		X"A9",X"45",X"10",X"8E",X"CD",X"54",X"8E",X"00",X"DF",X"8D",X"02",X"35",X"F6",X"37",X"02",X"A7",
		X"21",X"44",X"44",X"44",X"44",X"A7",X"A1",X"30",X"1F",X"26",X"F2",X"39",X"34",X"76",X"CE",X"DC",
		X"4E",X"10",X"8E",X"A9",X"00",X"8E",X"00",X"1A",X"BD",X"7F",X"33",X"8D",X"88",X"35",X"F6",X"34",
		X"76",X"8E",X"A9",X"1B",X"C6",X"28",X"6F",X"80",X"5A",X"26",X"FB",X"8D",X"92",X"7F",X"CF",X"12",
		X"7F",X"CF",X"13",X"7F",X"CF",X"14",X"35",X"F6",X"34",X"76",X"CE",X"DC",X"68",X"10",X"8E",X"A9",
		X"45",X"8E",X"00",X"DF",X"BD",X"7F",X"33",X"8D",X"9A",X"35",X"F6",X"34",X"76",X"CE",X"DD",X"46",
		X"10",X"8E",X"AA",X"24",X"8E",X"00",X"3C",X"BD",X"7F",X"33",X"35",X"F6",X"34",X"76",X"CE",X"A9",
		X"45",X"10",X"8E",X"C1",X"00",X"8E",X"01",X"1B",X"BD",X"7F",X"33",X"35",X"F6",X"34",X"76",X"CE",
		X"C1",X"00",X"10",X"8E",X"A9",X"45",X"8E",X"01",X"1B",X"BD",X"7F",X"33",X"BD",X"DA",X"A3",X"35",
		X"F6",X"34",X"76",X"CE",X"CC",X"00",X"10",X"8E",X"A9",X"00",X"8E",X"00",X"1B",X"8D",X"19",X"CE",
		X"CD",X"00",X"10",X"8E",X"A9",X"1B",X"8E",X"01",X"09",X"8D",X"0D",X"5F",X"B6",X"A9",X"06",X"81",
		X"09",X"26",X"01",X"5A",X"D7",X"8C",X"35",X"F6",X"37",X"06",X"48",X"48",X"48",X"48",X"34",X"02",
		X"C4",X"0F",X"EA",X"E0",X"E7",X"A0",X"30",X"1F",X"26",X"EE",X"39",X"8E",X"A9",X"3D",X"10",X"8E",
		X"BF",X"0C",X"BD",X"7F",X"16",X"10",X"8E",X"BB",X"C5",X"BD",X"7F",X"16",X"10",X"8E",X"DB",X"F5",
		X"CC",X"03",X"02",X"BD",X"2F",X"F8",X"EC",X"A4",X"FD",X"AA",X"61",X"EC",X"01",X"BD",X"65",X"FE",
		X"FD",X"A9",X"2B",X"8E",X"AA",X"61",X"10",X"8E",X"DB",X"F7",X"CC",X"02",X"01",X"BD",X"2F",X"F8",
		X"EC",X"84",X"BD",X"65",X"FE",X"B7",X"A9",X"2A",X"96",X"2C",X"4C",X"8E",X"A9",X"40",X"BD",X"7F",
		X"02",X"8E",X"A9",X"3D",X"10",X"8E",X"A9",X"40",X"CC",X"03",X"03",X"BD",X"2F",X"F8",X"EC",X"01",
		X"FD",X"AA",X"61",X"8E",X"AA",X"61",X"10",X"8E",X"DB",X"F7",X"CC",X"02",X"01",X"BD",X"2F",X"F8",
		X"EC",X"84",X"BD",X"65",X"FE",X"FD",X"A9",X"3A",X"E6",X"A4",X"4F",X"BD",X"65",X"FE",X"B7",X"A9",
		X"39",X"BD",X"DA",X"7F",X"39",X"0E",X"10",X"3C",X"DB",X"FE",X"00",X"41",X"66",X"44",X"4E",X"4F",
		X"20",X"43",X"4D",X"4F",X"53",X"20",X"52",X"41",X"4D",X"20",X"45",X"52",X"52",X"4F",X"52",X"53",
		X"20",X"44",X"45",X"54",X"45",X"43",X"54",X"45",X"44",X"FF",X"DC",X"26",X"00",X"5F",X"52",X"33",
		X"DC",X"38",X"00",X"53",X"66",X"33",X"43",X"4D",X"4F",X"53",X"20",X"52",X"41",X"4D",X"20",X"45",
		X"52",X"52",X"4F",X"52",X"20",X"4F",X"52",X"FF",X"57",X"52",X"49",X"54",X"45",X"20",X"50",X"52",
		X"4F",X"54",X"45",X"43",X"54",X"20",X"46",X"41",X"49",X"4C",X"55",X"52",X"45",X"FF",X"32",X"0A",
		X"03",X"01",X"01",X"01",X"03",X"03",X"01",X"00",X"04",X"00",X"01",X"00",X"01",X"00",X"00",X"00",
		X"00",X"00",X"05",X"05",X"03",X"00",X"01",X"01",X"57",X"49",X"4C",X"00",X"40",X"35",X"4D",X"52",
		X"53",X"00",X"40",X"20",X"52",X"4F",X"4E",X"00",X"39",X"15",X"4A",X"52",X"4E",X"00",X"38",X"34",
		X"54",X"4E",X"44",X"00",X"37",X"25",X"57",X"50",X"42",X"00",X"36",X"10",X"43",X"4C",X"53",X"00",
		X"35",X"03",X"4C",X"45",X"4F",X"00",X"34",X"78",X"44",X"52",X"59",X"00",X"33",X"21",X"4A",X"53",
		X"43",X"00",X"32",X"50",X"4A",X"45",X"48",X"00",X"31",X"36",X"52",X"4D",X"49",X"00",X"30",X"18",
		X"4B",X"45",X"4E",X"00",X"29",X"10",X"50",X"47",X"44",X"00",X"28",X"00",X"50",X"41",X"48",X"00",
		X"27",X"98",X"4E",X"56",X"42",X"00",X"26",X"72",X"41",X"47",X"52",X"00",X"25",X"29",X"56",X"4C",
		X"47",X"00",X"24",X"73",X"44",X"4F",X"4E",X"00",X"23",X"90",X"57",X"45",X"53",X"00",X"22",X"62",
		X"4A",X"50",X"44",X"00",X"21",X"83",X"50",X"46",X"5A",X"00",X"20",X"21",X"4B",X"47",X"4D",X"00",
		X"19",X"18",X"4B",X"52",X"44",X"00",X"18",X"99",X"53",X"43",X"4C",X"00",X"17",X"21",X"52",X"41",
		X"57",X"00",X"16",X"78",X"42",X"41",X"4E",X"00",X"15",X"21",X"50",X"56",X"41",X"00",X"14",X"52",
		X"4A",X"43",X"20",X"00",X"13",X"78",X"20",X"45",X"53",X"00",X"12",X"64",X"48",X"45",X"43",X"00",
		X"11",X"37",X"4D",X"42",X"53",X"00",X"10",X"62",X"52",X"43",X"42",X"00",X"09",X"35",X"50",X"4A",
		X"45",X"00",X"08",X"28",X"42",X"46",X"44",X"00",X"07",X"90",X"53",X"44",X"57",X"00",X"06",X"78",
		X"42",X"50",X"44",X"00",X"05",X"21",X"4A",X"52",X"4E",X"00",X"40",X"78",X"54",X"4E",X"44",X"00",
		X"34",X"21",X"57",X"50",X"42",X"00",X"32",X"78",X"43",X"4C",X"53",X"00",X"28",X"21",X"4C",X"45",
		X"4F",X"00",X"25",X"78",X"44",X"52",X"59",X"00",X"23",X"21",X"4D",X"52",X"53",X"00",X"21",X"78",
		X"52",X"4F",X"4E",X"00",X"19",X"21",X"4A",X"49",X"4C",X"00",X"18",X"78",X"4A",X"45",X"48",X"00",
		X"17",X"21",X"96",X"9C",X"27",X"3E",X"8E",X"AE",X"5E",X"F6",X"AE",X"5D",X"96",X"41",X"85",X"10",
		X"27",X"02",X"6C",X"85",X"85",X"20",X"27",X"2C",X"5C",X"C4",X"0F",X"F7",X"AE",X"5D",X"6F",X"85",
		X"CE",X"DE",X"07",X"CB",X"07",X"C4",X"0F",X"86",X"09",X"34",X"46",X"A6",X"85",X"A1",X"C0",X"26",
		X"09",X"5C",X"C4",X"0F",X"6A",X"E4",X"26",X"F3",X"20",X"0B",X"35",X"46",X"33",X"49",X"11",X"83",
		X"DE",X"19",X"26",X"E5",X"39",X"4F",X"BD",X"E5",X"61",X"BD",X"E0",X"E5",X"3F",X"10",X"CE",X"BF",
		X"00",X"BD",X"0D",X"8B",X"8E",X"DE",X"C9",X"86",X"09",X"BD",X"F5",X"42",X"30",X"88",X"06",X"4A",
		X"26",X"F7",X"8E",X"DE",X"FF",X"BD",X"F5",X"4F",X"86",X"02",X"BD",X"E0",X"76",X"1C",X"AF",X"10",
		X"8E",X"02",X"58",X"BD",X"E5",X"1F",X"96",X"41",X"85",X"04",X"26",X"04",X"31",X"3F",X"26",X"F3",
		X"7E",X"D3",X"E3",X"7F",X"AE",X"5D",X"39",X"04",X"01",X"05",X"09",X"08",X"00",X"05",X"03",X"06",
		X"02",X"05",X"05",X"07",X"08",X"04",X"04",X"07",X"08",X"54",X"55",X"52",X"4B",X"45",X"59",X"20",
		X"53",X"48",X"4F",X"4F",X"54",X"FF",X"47",X"41",X"4D",X"45",X"20",X"44",X"45",X"53",X"49",X"47",
		X"4E",X"FF",X"4A",X"6F",X"68",X"6E",X"20",X"52",X"2E",X"20",X"4E",X"65",X"77",X"63",X"6F",X"6D",
		X"65",X"72",X"FF",X"53",X"4F",X"46",X"54",X"57",X"41",X"52",X"45",X"FF",X"54",X"68",X"6F",X"6D",
		X"61",X"73",X"20",X"4E",X"2E",X"20",X"44",X"65",X"61",X"75",X"78",X"FF",X"57",X"61",X"79",X"6E",
		X"65",X"20",X"50",X"2E",X"20",X"42",X"72",X"65",X"69",X"76",X"6F",X"67",X"65",X"6C",X"FF",X"47",
		X"52",X"41",X"50",X"48",X"49",X"43",X"20",X"41",X"52",X"54",X"FF",X"43",X"68",X"72",X"69",X"73",
		X"20",X"4C",X"2E",X"20",X"53",X"69",X"6D",X"6D",X"6F",X"6E",X"73",X"FF",X"4A",X"69",X"6C",X"6C",
		X"20",X"43",X"68",X"69",X"74",X"74",X"65",X"6E",X"64",X"65",X"6E",X"FF",X"43",X"4F",X"50",X"59",
		X"52",X"49",X"47",X"48",X"54",X"20",X"28",X"43",X"29",X"20",X"31",X"39",X"38",X"34",X"20",X"57",
		X"49",X"4C",X"4C",X"49",X"41",X"4D",X"53",X"20",X"45",X"4C",X"45",X"43",X"54",X"52",X"4F",X"4E",
		X"49",X"43",X"53",X"20",X"49",X"4E",X"43",X"2E",X"FF",X"DE",X"19",X"00",X"6E",X"27",X"55",X"DE",
		X"26",X"00",X"71",X"40",X"AA",X"DE",X"32",X"00",X"62",X"4F",X"66",X"DE",X"43",X"00",X"7A",X"68",
		X"AA",X"DE",X"4C",X"00",X"65",X"77",X"66",X"DE",X"5C",X"00",X"5C",X"86",X"66",X"DE",X"6F",X"00",
		X"71",X"9F",X"AA",X"DE",X"7B",X"00",X"62",X"AE",X"66",X"DE",X"8C",X"00",X"65",X"BD",X"66",X"DE",
		X"9C",X"00",X"3A",X"D6",X"66",X"B7",X"C8",X"81",X"E6",X"88",X"12",X"34",X"04",X"C6",X"05",X"F7",
		X"C8",X"00",X"CE",X"03",X"07",X"FF",X"C8",X"86",X"CC",X"1C",X"7A",X"FD",X"C8",X"82",X"EC",X"0A",
		X"FD",X"C8",X"84",X"C6",X"3A",X"F7",X"C8",X"80",X"80",X"02",X"6D",X"E4",X"27",X"38",X"10",X"8E",
		X"DF",X"6D",X"30",X"06",X"E6",X"82",X"58",X"C4",X"1E",X"EE",X"A5",X"FF",X"C8",X"82",X"B7",X"C8",
		X"84",X"C6",X"1A",X"F7",X"C8",X"80",X"80",X"03",X"6A",X"E4",X"27",X"1A",X"E6",X"84",X"54",X"54",
		X"54",X"C4",X"1E",X"EE",X"A5",X"FF",X"C8",X"82",X"B7",X"C8",X"84",X"C6",X"3A",X"F7",X"C8",X"80",
		X"80",X"02",X"6A",X"E4",X"26",X"CE",X"C6",X"06",X"F7",X"C8",X"00",X"35",X"84",X"1C",X"7A",X"1C",
		X"8F",X"1C",X"A4",X"1C",X"B9",X"1C",X"CE",X"1C",X"E3",X"1C",X"F8",X"1D",X"0D",X"1D",X"22",X"1D",
		X"37",X"BD",X"66",X"A3",X"00",X"00",X"01",X"00",X"B3",X"4C",X"00",X"01",X"BD",X"66",X"A3",X"00",
		X"00",X"00",X"27",X"B5",X"4C",X"02",X"56",X"B6",X"A9",X"00",X"C6",X"64",X"3D",X"DD",X"45",X"39",
		X"34",X"07",X"1A",X"50",X"B7",X"C8",X"00",X"7F",X"CB",X"A0",X"FF",X"C8",X"82",X"10",X"BF",X"C8",
		X"84",X"BF",X"C8",X"86",X"C6",X"00",X"F7",X"C8",X"80",X"CC",X"06",X"01",X"B7",X"C8",X"00",X"F7",
		X"CB",X"A0",X"35",X"87",X"34",X"04",X"C6",X"14",X"F7",X"C9",X"00",X"35",X"84",X"34",X"06",X"86",
		X"00",X"20",X"04",X"34",X"06",X"86",X"04",X"BF",X"C8",X"82",X"10",X"BF",X"C8",X"84",X"F7",X"C8",
		X"86",X"C6",X"02",X"F7",X"C8",X"87",X"B7",X"C8",X"80",X"35",X"86",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;