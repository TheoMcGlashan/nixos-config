local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local function in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local math = { condition = in_mathzone, show_condition = in_mathzone }

return {

	-- ======================================================
	-- TEMPLATE
	-- ======================================================

	s("template", {
		t({
			"\\documentclass[12pt]{amsart}",
			"\\usepackage{amsmath}",
			"\\usepackage{amsthm}",
			"\\usepackage{amsfonts}",
			"\\usepackage{mathrsfs}",
			"\\usepackage{graphicx}",
			"\\usepackage{setspace}",
			"\\usepackage{float}",
			"\\usepackage{mathtools}",
			"\\usepackage[margin=1in]{geometry}",
			"",
			"\\title{",
		}),
		i(1),
		t({
			"}",
			"\\author{Theo McGlashan}",
			"\\date{\\today}",
			"\\begin{document}",
			"\\onehalfspacing",
			"\\maketitle",
			"",
			"",
		}),
		i(2),
		t({
			"",
			"",
			"\\end{document}",
		}),
	}),

	-- ======================================================
	-- ENVIRONMENTS AND SECTIONS
	-- ======================================================
	--
	s("sbsa", {
		t("\\subsection*{"), i(1), t("}") 
	}),

	s("scta", {
    t("\\section*{"), i(1), t("}")
	}),

	s("sct", {
    t("\\section{"), i(1), t("}")
	}),

	s("sbs", {
    t("\\subsection{"), i(1), t("}")
  }),

	s({ trig = "txt", snippetType = "autosnippet" }, {
		t("\\text{"), i(1), t("}") 
	}, math ),

	s("bgn", {
			t("\\begin{"), i(1, "env"), t("}"),
			t({"", "\t"}), i(0),
			t({"", "\\end{"}), rep(1), t("}")
	}),

	s("ctr", {
		t({ "\\begin{center}", "\t" }),
		i(1),
		t({ "", "\\end{center}" }),
	}),

	s("eqta", {
		t({ "\\begin{equation*}", "\t" }),
		i(1),
		t({ "", "\\end{equation*}" }),
	}),

	s("eqt", {
		t({ "\\begin{equation}", "\t" }),
		i(1),
		t({ "", "\\end{equation}" }),
	}),

	s("alna", {
		t({ "\\begin{align*}", "\t" }),
		i(1),
		t({ "", "\\end{align*}" }),
	}),

	s("aln", {
		t({ "\\begin{align}", "\t" }),
		i(1),
		t({ "", "\\end{align}" }),
	}),

	s("gtr", {
		t({ "\\begin{gather}", "\t" }),
		i(1),
		t({ "", "\\end{gather}" }),
	}),

	s("gtra", {
		t({ "\\begin{gather*}", "\t" }),
		i(1),
		t({ "", "\\end{gather*}" }),
	}),

	s("cse", {
		t({ "\\begin{cases}", "\t" }),
		i(1),
		t({ "", "\\end{cases}" }),
	}),

	s("enr", {
		t({ "\\begin{enumerate}", "\t\\item " }),
		i(1),
		t({ "", "\\end{enumerate}" }),
	}),

	s("itm", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		t({ "", "\\end{itemize}" }),
	}),

	s("prf", {
		t({ "\\begin{proof}", "\t" }),
		i(1),
		t({ "", "\\end{proof}" }),
	}),

	s("tbg", {
		t({ "\\begin{tabbing}", "\t" }),
		t({ "----\\=----\\=----\\=----\\=----\\=\\kill",
			"\t" }),
		i(1),
		t({ "", "\\end{tabbing}" }),
	}),

	s("fgr", {
		t({ "\\begin{figure}[H]", "\t\\centering" }),
		t({ "", "\t\\includegraphics[height=18em]{" }),
		i(1), t("}"),
		t({ "", "\t\\caption{" }),
		i(2), t("}"),
		t({ "", "\t\\label{" }),
		i(3), t("}"),
		t({ "", "\\end{figure}" }),
	}),
	
	-- ======================================================
	-- SYMBOLS
	-- ======================================================

	s({ trig = "in", snippetType = "autosnippet",
		wordTrig = false },
	{ t("\\in ") }, math),

	s({ trig = "fal", snippetType = "autosnippet" },
	{ t("\\forall ") }, math),

	s({ trig = "exs", snippetType = "autosnippet" },
	{ t("\\exists ") }, math),

	s({ trig = "nbn", snippetType = "autosnippet" },
	{ t("\\nonumber ") }, math),

	s({ trig = "blt", snippetType = "autosnippet" },
	{ t("\\bullet ") }, math),

	s({ trig = "dts", snippetType = "autosnippet" }, {
		t("\\dots ")
	}, math),

	s({trig = "leq", snippetType = "autosnippet",
		wordTrig = false }, {
			t("\\leq "),
	}, math),

	s({trig = "geq", snippetType = "autosnippet",
		wordTrig = false }, {
			t("\\geq "),
	}, math),

	s({trig = "neq", snippetType = "autosnippet",
		wordTrig = false }, {
			t("\\neq "),
	}, math),

	s({ trig = "nbl", snippetType = "autosnippet" },
	{ t("\\nabla ") }, math),

	s({ trig = "ift", snippetType = "autosnippet" },
	{ t("\\infty ") }, math),

	s({ trig = "cdt", snippetType = "autosnippet" },
	{ t("\\cdot ") }, math),

	s({ trig = "tms", snippetType = "autosnippet" },
	{ t("\\times ") }, math),

	s({ trig = "crc", snippetType = "autosnippet" },
	{ t("\\circ ") }, math),

	s({ trig = "ceq", snippetType = "autosnippet" },
	{ t("\\coloneq ") }, math),

	s({ trig = "eqc", snippetType = "autosnippet" },
	{ t("\\eqcolon ") }, math),

	-- ======================================================
	-- SIMPLE CONSTRUCTS
	-- ======================================================
	
	s({ trig = "$", snippetType = "autosnippet",
		wordTrig = false }, {
			t("$"), i(1), t("$"),
		}),

	s({ trig = "sqr", snippetType = "autosnippet"},
	{ t("\\sqrt{"), i(1), t("}"), },
		math
	),

	s({ trig = "nrm", snippetType = "autosnippet" },
	{
		t("\\| "), i(1), t(" \\|"),
	},
		math
	),

	s({ trig = "asv", snippetType = "autosnippet" },
	{
		t("| "), i(1), t(" |"),
	},
		math
	),

	s({ trig = "ipr", snippetType = "autosnippet" },
	{
		t("\\langle "), i(1), t(", "), i(2), t(" \\rangle"),
	}, 
		math
	),

	s({ trig = "wpr", snippetType = "autosnippet" },
	{
		t("\\{ "), i(1), t(" \\}"),
	},
		math
	),

	s({ trig = "bpr", snippetType = "autosnippet" },
	{
		t("\\left("), i(1), t("\\right)") },
		math
	),

	s({ trig = "bav", snippetType = "autosnippet" },
	{
		t("\\left|"), i(1), t("\\right|") },
		math
	),

	s({ trig = "bnm", snippetType = "autosnippet" },
	{
		t("\\left\\|"), i(1), t("\\right\\|") },
		math
	),

	s({ trig = "bwp", snippetType = "autosnippet" },
	{
		t("\\left\\{"), i(1), t("\\right\\}") },
		math
	),

	s({ trig = "brk", snippetType = "autosnippet" },
	{
		t("\\left["), i(1), t("\\right]") },
		math
	),

	s({ trig = "lbl", snippetType = "autosnippet" },
	{ t("\\label{"), i(1), t("}") },
		math
	),

	s("eqr", {
		t("\\eqref{"),
		i(1),
		t("}"),
	}),

	-- ======================================================
	-- COMPLEX CONSTRUCTS
	-- ======================================================

	s({ trig = "frc", snippetType = "autosnippet"},
		{ t("\\frac{"), i(1), t("}{"), i(2), t("}"), },
		math
	),

	s( {trig = "itg", snippetType = "autosnippet"},
	{
		t("\\int_{"), i(1), t("}^{"), i(2), t("} "), i(3),
	},
		math
	),

	s( {trig = "iitg", snippetType = "autosnippet"},
	{
		t("\\iint_{"), i(1), t("}^{"), i(2), t("} "), i(3),
	},
		math
	),

	s({ trig = "smt", snippetType = "autosnippet" },
	{
		t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3),
	},
		math
	),

	s({ trig = "prd", snippetType = "autosnippet" },
	{
		t("\\prod_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("} "), i(3),
	},
		math
	),

	s({ trig = "lmt", snippetType = "autosnippet" },
	{
		t("\\lim_{"), i(1, "x \\to 0"), t("} "), i(2),
	},
		math
	),

	s({ trig = "ptl", snippetType = "autosnippet" },
	{
		t("\\frac{\\partial "), i(1), t("}{\\partial "), i(2), t("}"),
	},
		math
	),

	-- ======================================================
	-- MODIFIERS
	-- ======================================================

	s({ trig = "sj", snippetType = "autosnippet", wordTrig = false },
		{ t("_{"), i(1), t("}") },
		math
	),

	s({ trig = "sk", snippetType = "autosnippet", wordTrig = false },
		{ t("^{"), i(1), t("}") },
		math
	),

	s({ trig ="hat", snippetType = "autosnippet"},
	{ t("\\hat{"), i(1), t("}"), },
		math
	),

	s({ trig ="ovl", snippetType = "autosnippet"},
	{ t("\\overline{"), i(1), t("}"), },
		math
	),

	s({ trig ="tld", snippetType = "autosnippet"},
	{ t("\\widetilde{"), i(1), t("}"), },
		math
	),

	s("hsp", { t("\\hspace{"), i(1), t("em}") }),

	s("vsp", { t("\\vspace{"), i(1), t("em}") }),

	-- ======================================================
	-- SCRIPTS
	-- ======================================================

	s({ trig = "RR", snippetType = "autosnippet" },
	{ t("\\mathbb{R}") },
		math
	),

	s({ trig = "ZZ", snippetType = "autosnippet" },
	{ t("\\mathbb{Z}") },
		math
	),

	s({ trig = "NN", snippetType = "autosnippet" },
	{ t("\\mathbb{N}") },
		math
	),
	s({ trig = "QQ", snippetType = "autosnippet" },
	{ t("\\mathbb{Q}") },
		math
	),
	s({ trig = "CC", snippetType = "autosnippet" },
	{ t("\\mathbb{C}") },
		math
	),
	s({ trig = "mcl", snippetType = "autosnippet" },
	{ t("\\mathcal{"), i(1), t("}")},
		math
	),
	s({ trig = "mbb", snippetType = "autosnippet" },
	{ t("\\mathbb{"), i(1), t("}")},
		math
	),
	s({ trig = "msc", snippetType = "autosnippet" },
	{ t("\\mathscr{"), i(1), t("}")},
		math
	),
	s("tit", {
		t("\\textit{"), i(1), t("}"),
	}),
	s("tbf", {
		t("\\textbf{"), i(1), t("}"),
	}),

	-- ======================================================
	-- GREEK LETTERS
	-- ======================================================

	s({ trig = "aa", snippetType = "autosnippet" }, { t("\\alpha ") },      math),
	s({ trig = "bb", snippetType = "autosnippet" }, { t("\\beta" ) },       math),
	s({ trig = "gg", snippetType = "autosnippet" }, { t("\\gamma ") },      math),
	s({ trig = "GG", snippetType = "autosnippet" }, { t("\\Gamma ") },      math),
	s({ trig = "dd", snippetType = "autosnippet" }, { t("\\delta ") },      math),
	s({ trig = "DD", snippetType = "autosnippet" }, { t("\\Delta ") },      math),
	s({ trig = "ee", snippetType = "autosnippet" }, { t("\\varepsilon ") },    math),
	s({ trig = "zz", snippetType = "autosnippet" }, { t("\\zeta ") },       math),
	s({ trig = "tt", snippetType = "autosnippet" }, { t("\\theta ") },      math),
	s({ trig = "TT", snippetType = "autosnippet" }, { t("\\Theta ") },      math),
	s({ trig = "ll", snippetType = "autosnippet" }, { t("\\lambda ") },     math),
	s({ trig = "LL", snippetType = "autosnippet" }, { t("\\Lambda ") },     math),
	s({ trig = "mm", snippetType = "autosnippet" }, { t("\\mu ") },         math),
	s({ trig = "nn", snippetType = "autosnippet" }, { t("\\nu ") },         math),
	s({ trig = "pp", snippetType = "autosnippet" }, { t("\\pi ") },         math),
	s({ trig = "PP", snippetType = "autosnippet" }, { t("\\Pi ") },         math),
	s({ trig = "ss", snippetType = "autosnippet" }, { t("\\sigma ") },      math),
	s({ trig = "SS", snippetType = "autosnippet" }, { t("\\Sigma ") },      math),
	s({ trig = "oo", snippetType = "autosnippet" }, { t("\\omega ") },      math),
	s({ trig = "OO", snippetType = "autosnippet" }, { t("\\Omega ") },      math),
	s({ trig = "ff", snippetType = "autosnippet" }, { t("\\phi ") },        math),
	s({ trig = "vf", snippetType = "autosnippet" }, { t("\\varphi ") },     math),
	s({ trig = "ps", snippetType = "autosnippet" }, { t("\\psi ") },        math),
	s({ trig = "PS", snippetType = "autosnippet" }, { t("\\Psi ") },        math),
	s({ trig = "xx", snippetType = "autosnippet" }, { t("\\xi ") },         math),
	s({ trig = "XX", snippetType = "autosnippet" }, { t("\\Xi ") },         math),
	s({ trig = "et", snippetType = "autosnippet" }, { t("\\eta ") },        math),
	s({ trig = "rr", snippetType = "autosnippet" }, { t("\\rho ") },        math),
	s({ trig = "kk", snippetType = "autosnippet" }, { t("\\kappa ") },      math),
	s({ trig = "chi", snippetType = "autosnippet" }, { t("\\chi ") },        math),
}
