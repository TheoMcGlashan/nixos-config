local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local rep = require("luasnip.extras").rep

-- Function to tell if in math mode.
local function in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local math = { condition = in_mathzone, show_condition = in_mathzone }

-- Function to build a table of any size
local function table_node(_, parent)
    local rows = tonumber(parent.captures[1])
    local cols = tonumber(parent.captures[2])

    local nodes = {}
    local idx = 1

    local colspec = "|" .. string.rep("c|", cols)

    table.insert(nodes, t({
				"{\\Large",
        "\\begin{center}",
        "\\begin{tabular}{ " .. colspec .. " } ",
        " \\hline",
        " "
    }))

    for r = 1, rows do
        for c = 1, cols do
            table.insert(nodes, i(idx))
            idx = idx + 1
            if c < cols then
                table.insert(nodes, t(" & "))
            end
        end
        table.insert(nodes, t({ " \\\\ ", " \\hline", " " }))
    end

    table.insert(nodes, t({
        "\\end{tabular}",
        "\\end{center}",
				"}"
    }))

    return sn(nil, nodes)
end

return {
	-- ======================================================
	-- TEMPLATES
	-- ======================================================
	
	s("template", {
		t({
			"\\documentclass[12pt]{article}",
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

	s("lessonplan", {
		t({
			"\\documentclass[14pt]{extarticle}",
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
			"\\title{Lesson ",
		}),
		i(1),
		t({
			"}",
			"\\author{Trinity-Pawling}",
			"\\date{2026-2027}",
			"\\begin{document}",
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

	s("test", {
		t({
			"\\documentclass[14pt]{extarticle}",
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
			"\\author{Trinity-Pawling}",
			"\\date{2026-2027}",
			"\\begin{document}",
			"\\maketitle",
			"\\onehalfspace",
			"",
			"\\textbf{Name:} \\underline{\\hspace{8em}}",
			"",
			"\\textbf{Note:} Whenever possible, \\textbf{show your work.} A four-function calculator is permitted. Each question is worth ", 
		}), i(2),
		t(" points, for a total of "), i(3),
		t(" points."),
		t(""), i(4), t(""),
		t("\\end{document}"),
	}),
	-- ======================================================
	-- ENVIRONMENTS AND SECTIONS
	-- ======================================================

	-- Invoke function to create table of variable size
	s({ trig="tbl(%d+)x(%d+)", regTrig=true },
		{ d(1, table_node, {}) }),

	s("sbs", { t("\\subsection*{"), i(1), t("}") }),

	s("sct", { t("\\section*{"), i(1), t("}") }),

	s("scn", { t("\\section{"), i(1), t("}") }),

	s("sbn", { t("\\subsection{"), i(1), t("}") }),

	s({ trig = "txt", snippetType = "autosnippet" }, 
		{ t("\\text{"), i(1), t("}")  }, math ),

	s("bgn", {
			t("\\begin{"), i(1, "env"), t("}"),
			t({"", "\t"}), i(0),
			t({"", "\\end{"}), rep(1), t("}"),
			t(""), i(2),
	}),

	s("ctr", {
		t({ "\\begin{center}", "\t" }),
		i(1),
		t({ "", "\\end{center}" }),
		t(""), i(2),
	}),

	s("eqt", {
		t({ "\\begin{equation*}", "\t" }),
		i(1),
		t({ "", "\\end{equation*}" }),
		t(""), i(2),
	}),

	s("eqn", {
		t({ "\\begin{equation}", "\t" }),
		i(1),
		t({ "", "\\end{equation}" }),
		t(""), i(2),
	}),

	s("alg", {
		t({ "\\begin{align*}", "\t" }),
		i(1),
		t({ "", "\\end{align*}" }),
		t(""), i(2),
	}),

	s("aln", {
		t({ "\\begin{align}", "\t" }),
		i(1),
		t({ "", "\\end{align}" }),
		t(""), i(2),
	}),

	s("gth", {
		t({ "\\begin{gather}", "\t" }),
		i(1),
		t({ "", "\\end{gather}" }),
		t(""), i(2),
	}),

	s("gtr", {
		t({ "\\begin{gather*}", "\t" }),
		i(1),
		t({ "", "\\end{gather*}" }),
		t(""), i(2),
	}),

	s("cse", {
		t({ "\\begin{cases}", "\t" }),
		i(1),
		t({ "", "\\end{cases}" }),
		t(""), i(2),
	}),

	s("enr", {
		t({ "\\begin{enumerate}", "\t\\item " }),
		i(1),
		t({ "", "\\end{enumerate}" }),
		t(""), i(2),
	}),

	s("itm", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		t({ "", "\\end{itemize}" }),
		t(""), i(2),
	}),

	s("prf", {
		t({ "\\begin{proof}", "\t" }),
		i(1),
		t({ "", "\\end{proof}" }),
		t(""), i(2),
	}),

	s("tbg", {
		t({ "\\begin{tabbing}", "\t" }),
		t({ "----\\=----\\=----\\=----\\=----\\=\\kill",
			"\t" }),
		i(1),
		t({ "", "\\end{tabbing}" }),
		t(""), i(2),
	}),

	s("fgr", {
		t({ "\\begin{figure}[H]", "\t\\centering" }),
		t({ "", "\t\\includegraphics[height=17em]{" }),
		i(1), t("}"),
		t({ "", "\t\\caption{" }),
		i(2), t("}"),
		t({ "", "\\end{figure}" }),
		t(""), i(3),
	}),
	
	-- ======================================================
	-- SYMBOLS
	-- ======================================================

	s({ trig = "ii", snippetType = "autosnippet",
		wordTrig = false }, { t("\\in ") }, math),

	s({ trig = "fal", snippetType = "autosnippet",
		wordTrig = false }, { t("\\forall ") }, math),

	s({ trig = "exs", snippetType = "autosnippet",
		wordTrig = false}, { t("\\exists ") }, math),

	s({ trig = "nbn", snippetType = "autosnippet",
		wordTrig = false}, { t("\\nonumber ") }, math),

	s({ trig = "blt", snippetType = "autosnippet",
		wordTrig = false}, { t("\\bullet ") }, math),

	s({ trig = "dts", snippetType = "autosnippet",
		wordTrig = false}, { t("\\ldots ") }, math),

	s({trig = "leq", snippetType = "autosnippet",
		wordTrig = false }, { t("\\leq "), }, math),

	s({trig = "geq", snippetType = "autosnippet",
		wordTrig = false }, { t("\\geq "), }, math),

	s({trig = "neq", snippetType = "autosnippet",
		wordTrig = false }, { t("\\neq "), }, math),

	s({ trig = "ift", snippetType = "autosnippet",
		wordTrig = false }, { t("\\infty ") }, math),

	s({ trig = "cdt", snippetType = "autosnippet",
		wordTrig = false }, { t("\\cdot ") }, math),

	s({ trig = "tms", snippetType = "autosnippet",
		wordTrig = false }, { t("\\times ") }, math),

	s({ trig = "crc", snippetType = "autosnippet",
		wordTrig = false }, { t("\\circ ") }, math),

	s({ trig = "ceq", snippetType = "autosnippet",
		wordTrig = false }, { t("\\coloneq ") }, math),

	s({ trig = "eqc", snippetType = "autosnippet",
		wordTrig = false }, { t("\\eqcolon ") }, math),

	s({ trig = "vv", snippetType = "autosnippet",
		wordTrig = false }, { t("\\vec{"), i(1), t("}") }, math),

	s({ trig = "ovr", snippetType = "autosnippet",
		wordTrig = false }, 
		{ t("\\overrightarrow{"), i(1), t("}") }, math),

	-- ======================================================
	-- SIMPLE CONSTRUCTS
	-- ======================================================
	
	s({ trig = "$", snippetType = "autosnippet" }, 
	{ t("$"), i(1), t("$"), }),

	s({ trig = "sqr", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\sqrt["), i(1), t("]{"), i(2), t("}")}, math ),

	s({ trig = "nrm", snippetType = "autosnippet",
		wordTrig = false }, 
		{ t("\\| "), i(1), t(" \\|"), }, math ),

	s({ trig = "asv", snippetType = "autosnippet",
		wordTrig = false },
		{ t("| "), i(1), t(" |"), }, math ),

	s({ trig = "ipr", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\langle "), i(1), t(", "), i(2), t(" \\rangle"), },
		math ),

	s({ trig = "wpr", snippetType = "autosnippet",
		wordTrig = false }, { t("\\{ "), i(1), t(" \\}"), }, math ),

	s({ trig = "bpr", snippetType = "autosnippet",
		wordTrig = false }, 
		{ t("\\left("), i(1), t("\\right)") }, math ),

	s({ trig = "bav", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\left|"), i(1), t("\\right|") }, math ),

	s({ trig = "bnm", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\left\\|"), i(1), t("\\right\\|") }, math ),

	s({ trig = "bwp", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\left\\{"), i(1), t("\\right\\}") }, math ),

	s({ trig = "brk", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\left["), i(1), t("\\right]") }, math ),

	s({ trig = "lbl", snippetType = "autosnippet",
		wordTrig = false }, 
		{ t("\\label{"), i(1), t("}") }, math ),

	s("eqr", { t("\\eqref{"), i(1), t("}"), }),

	-- ======================================================
	-- COMPLEX CONSTRUCTS
	-- ======================================================

	s({ trig = "frc", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\frac{"), i(1), t("}{"), i(2), t("}"), }, math ),

	s( {trig = "itg", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\int_{"), i(1), t("}^{"), i(2), t("} "), i(3), }, math ),

	s({ trig = "smt", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\sum_{"), i(1, "i=1"), t("}^{"), 
		i(2, "n"), t("} "), i(3), }, math ),

	s({ trig = "prd", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\prod_{"), i(1, "i=1"), t("}^{"),
		i(2, "n"), t("} "), i(3), }, math ),

	s({ trig = "lmt", snippetType = "autosnippet",
		wordTrig = false},
		{ t("\\lim_{"), i(1, "x \\to 0"), t("} "), i(2), }, math ),

	s({ trig = "ptl", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\frac{\\partial "), i(1), t("}{\\partial "),
		i(2), t("}"), }, math ),

	s({ trig = "ubr", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\underbrace{"), i(1), t("}_{"), i(2), t("}"), }, math ),

	s({ trig = "bmr", snippetType = "autosnippet",
		wordTrig = false },
		{ t( {"\\begin{bmatrix}", "\t" }),
			i(1), t(" & "), i(2), t( { " \\\\", "\t" }),
			i(3), t(" & "), i(4),
			t({ "", "\\end{bmatrix}" }),
			t(""), i(5), 
		}, math),

	s({ trig = "vmr", snippetType = "autosnippet",
		wordTrig = false },
		{ t( {"\\begin{vmatrix}", "\t" }),
			i(1), t(" & "), i(2), t( { " \\\\", "\t" }),
			i(3), t(" & "), i(4),
			t({ "", "\\end{vmatrix}" }),
			t(""), i(5),
		}, math),

	-- ======================================================
	-- MODIFIERS
	-- ======================================================

	s({ trig = "sj", snippetType = "autosnippet", wordTrig = false },
		{ t("_{"), i(1), t("}") }, math ),

	s({ trig = "sk", snippetType = "autosnippet", wordTrig = false },
		{ t("^{"), i(1), t("}") }, math ),

	s({ trig ="hat", snippetType = "autosnippet",
		wordTrig = false }, { t("\\hat{"), i(1), t("}"), }, math ),

	s({ trig ="ovl", snippetType = "autosnippet",
		wordTrig = false },
	  { t("\\overline{"), i(1), t("}"), }, math ),

	s({ trig ="tld", snippetType = "autosnippet",
		wordTrig = false },
		{ t("\\widetilde{"), i(1), t("}"), }, math ),

	s("hsp", { t("\\hspace{"), i(1), t("em}") }),

	s("vsp", { t("\\vspace{"), i(1), t("em}") }),

	-- ======================================================
	-- SCRIPTS
	-- ======================================================

	s({ trig = "RR", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{R}") }, math ),

	s({ trig = "ZZ", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{Z}") }, math ),

	s({ trig = "NN", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{N}") }, math ),

	s({ trig = "QQ", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{Q}") }, math ),
	s({ trig = "CC", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{C}") }, math ),

	s({ trig = "mcl", snippetType = "autosnippet",
		wordTrig = false}, { t("\\mathcal{"), i(1), t("}")}, math ),

	s({ trig = "mbb", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbb{"), i(1), t("}")}, math ),

	s({ trig = "msc", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathscr{"), i(1), t("}")}, math ),

	s({ trig = "mbf", snippetType = "autosnippet",
		wordTrig = false }, { t("\\mathbf{"), i(1), t("}")}, math ),

	s("tit", { t("\\textit{"), i(1), t("}"), }),

	s("tbf", { t("\\textbf{"), i(1), t("}"), }),

	-- ======================================================
	-- GREEK LETTERS
	-- ======================================================

	s({ trig = "aa", snippetType = "autosnippet" }, { t("\\alpha ") },      math),
	s({ trig = "bb", snippetType = "autosnippet" }, { t("\\beta " ) },       math),
	s({ trig = "gg", snippetType = "autosnippet" }, { t("\\gamma ") },      math),
	s({ trig = "dd", snippetType = "autosnippet" }, { t("\\delta ") },      math),
	s({ trig = "DD", snippetType = "autosnippet" }, { t("\\Delta ") },      math),
	s({ trig = "ee", snippetType = "autosnippet" }, { t("\\epsilon") },    math),
	s({ trig = "kk", snippetType = "autosnippet" }, { t("\\kappa") },    math),
	s({ trig = "tt", snippetType = "autosnippet" }, { t("\\theta ") },      math),
	s({ trig = "ll", snippetType = "autosnippet" }, { t("\\lambda ") },     math),
	s({ trig = "mm", snippetType = "autosnippet" }, { t("\\mu ") },         math),
	s({ trig = "nn", snippetType = "autosnippet" }, { t("\\nu ") },         math),
	s({ trig = "pp", snippetType = "autosnippet" }, { t("\\pi ") },         math),
	s({ trig = "ss", snippetType = "autosnippet" }, { t("\\sigma ") },      math),
	s({ trig = "oo", snippetType = "autosnippet" }, { t("\\omega ") },      math),
	s({ trig = "ff", snippetType = "autosnippet" }, { t("\\phi ") },        math),
	s({ trig = "hh", snippetType = "autosnippet" }, { t("\\varphi ") },     math),
	s({ trig = "xx", snippetType = "autosnippet" }, { t("\\xi ") },         math),
	s({ trig = "yy", snippetType = "autosnippet" }, { t("\\eta ") },        math),
	s({ trig = "rr", snippetType = "autosnippet" }, { t("\\rho ") },        math),
	s({ trig = "cc", snippetType = "autosnippet" }, { t("\\chi ") },        math),
	s({ trig = "LL", snippetType = "autosnippet", },
	{ t("\\nabla ") }, math),
}
