SELECT A.BUSINESS_UNIT,
       B.LEDGER,
       B.ACCOUNT,
       C.DESCR,
       E.TREE_NODE,
       F.DESCR,
       A.FISCAL_YEAR,
       A.ACCOUNTING_PERIOD,
       A.JOURNAL_ID,
       B.MONETARY_AMOUNT,
       B.PRODUCT,
       B.DEPTID,
       B.OPERATING_UNIT,
       B.FUND_CODE,
       B.PROGRAM_CODE,
       B.CHARTFIELD1,
       B.PROJECT_ID,
       A.TRANS_REF_NUM,
       B.JRNL_LN_REF,
       I.VENDOR_ID,
       I.NAME1,
       A.OPRID,
       B.HIST_PART_BRL_1,
       B.HIST_PART_BRL_2,
       B.HIST_PART_BRL_3,
       B.HIST_PART_BRL_4,
       A.DESCR,
       J.OPRDEFNDESC
  FROM PS_JRNL_HEADER     A,
       PS_JRNL_LN         B,
       PS_GL_ACCOUNT_TBL  C,
       PSTREENODE         E,
       PS_TREE_NODE_TBL   F,
       PSTREELEAF         D,
       PS_VCHR_ACCTG_LINE G,
       PS_VOUCHER         H,
       PS_VENDOR          I,
       PSOPRDEFN          J
 WHERE (A.BUSINESS_UNIT = B.BUSINESS_UNIT AND A.JOURNAL_ID = B.JOURNAL_ID AND
       A.JOURNAL_DATE = B.JOURNAL_DATE AND A.UNPOST_SEQ = B.UNPOST_SEQ AND
       C.ACCOUNT = B.ACCOUNT AND
       C.EFFDT = (SELECT MAX(C_ED.EFFDT)
                     FROM PS_GL_ACCOUNT_TBL C_ED
                    WHERE C.SETID = C_ED.SETID
                      AND C.ACCOUNT = C_ED.ACCOUNT
                      AND C_ED.EFFDT <= SYSDATE) AND
       E.EFFDT = (SELECT MAX(E_ED.EFFDT)
                     FROM PSTREENODE E_ED
                    WHERE E.SETID = E_ED.SETID
                      AND E.SETCNTRLVALUE = E_ED.SETCNTRLVALUE
                      AND E.TREE_NAME = E_ED.TREE_NAME
                      AND E_ED.EFFDT <= SYSDATE) AND E.SETID = F.SETID AND
       E.TREE_NODE = F.TREE_NODE AND
       F.EFFDT = (SELECT MAX(F_ED.EFFDT)
                     FROM PS_TREE_NODE_TBL F_ED
                    WHERE F.SETID = F_ED.SETID
                      AND F.TREE_NODE = F_ED.TREE_NODE
                      AND F_ED.EFFDT <= SYSDATE) AND
       A.JRNL_HDR_STATUS IN ('P', 'U') AND E.SETID = :1 AND
       E.SETCNTRLVALUE = ' ' AND A.BUSINESS_UNIT >= :2 AND
       E.TREE_NAME = :3 AND A.BUSINESS_UNIT <= :4 AND B.LEDGER = :5 AND
       A.FISCAL_YEAR = :6 AND A.ACCOUNTING_PERIOD >= :7 AND
       A.ACCOUNTING_PERIOD <= :8 AND E.TREE_NODE >= :9 AND
       E.TREE_NODE <= :10 AND B.ACCOUNT >= :11 AND B.ACCOUNT <= :12 AND
       B.DEPTID = DECODE(REPLACE(:13, '%', ' '), ' ', B.DEPTID, :14) AND
       B.OPERATING_UNIT =
       DECODE(REPLACE(:15, '%', ' '), ' ', B.OPERATING_UNIT, :16) AND
       B.PRODUCT = DECODE(REPLACE(:17, '%', ' '), ' ', B.PRODUCT, :18) AND
       B.FUND_CODE = DECODE(REPLACE(:19, '%', ' '), ' ', B.FUND_CODE, :20) AND
       B.PROGRAM_CODE =
       DECODE(REPLACE(:21, '%', ' '), ' ', B.PROGRAM_CODE, :22) AND
       B.CHARTFIELD1 =
       DECODE(REPLACE(:23, '%', ' '), ' ', B.CHARTFIELD1, :24) AND
       B.PROJECT_ID =
       DECODE(REPLACE(:25, '%', ' '), ' ', B.PROJECT_ID, :26) AND
       A.TRANS_REF_NUM =
       DECODE(REPLACE(:27, '%', ' '), ' ', A.TRANS_REF_NUM, :28) AND
       E.SETID = D.SETID AND E.SETCNTRLVALUE = D.SETCNTRLVALUE AND
       E.TREE_NAME = D.TREE_NAME AND E.TREE_NODE_NUM = D.TREE_NODE_NUM AND
       E.TREE_BRANCH = D.TREE_BRANCH AND
       D.EFFDT = (SELECT MAX(D_ED.EFFDT)
                     FROM PSTREELEAF D_ED
                    WHERE D.SETID = D_ED.SETID
                      AND D.SETCNTRLVALUE = D_ED.SETCNTRLVALUE
                      AND D.TREE_NAME = D_ED.TREE_NAME
                      AND D_ED.EFFDT <= SYSDATE) AND C.SETID = D.SETID AND
       C.ACCOUNT BETWEEN D.RANGE_FROM AND D.RANGE_TO AND
       A.SOURCE = DECODE(REPLACE(:29, '%', ' '), ' ', A.SOURCE, :30) AND
       B.BUSINESS_UNIT = G.BUSINESS_UNIT(+) AND
       B.JOURNAL_ID = G.JOURNAL_ID(+) AND
       B.JOURNAL_DATE = G.JOURNAL_DATE(+) AND
       B.JOURNAL_LINE = G.JOURNAL_LINE(+) AND B.LEDGER = G.LEDGER(+) AND
       B.JRNL_LN_REF = G.VOUCHER_ID(+) AND G.GL_DISTRIB_STATUS(+) = 'D' AND
       G.BUSINESS_UNIT = H.BUSINESS_UNIT(+) AND
       G.VOUCHER_ID = H.VOUCHER_ID(+) AND H.VENDOR_SETID = I.SETID(+) AND
       H.VENDOR_ID = I.VENDOR_ID(+) AND H.OPRID = J.OPRID(+))