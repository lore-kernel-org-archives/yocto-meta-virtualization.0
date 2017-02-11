Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1A68E0089D; Sat, 11 Feb 2017 07:58:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nitishjha16[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4192E0086E
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Feb 2017 07:57:57 -0800 (PST)
Received: by mail-it0-f42.google.com with SMTP id c7so157849536itd.1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Feb 2017 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1B0lELIZzHoZuc/EWs1IySTiVYo63N+j2GW7t7Mhc2Y=;
	b=Q1pS6sXta2Bwe65dyLfTbr0WudNSi8geGqepxV0myA939Oj403vVk75JJoudii4Q7m
	hrCtMgbFKb2065Q8M9mfyOab0s5FgsMtgs23wtiGOgx5vREBAleI0Tsw+/oc3tjWGd4h
	NvzqmqAfh8Xl9lTs2X90cmL6wMvFC8BmkTfI37ECjCLlGwMWOni0r9LJSohF2xX6sodF
	rNQpD5oFjrs3c3uQNwcs2xORboPATqZedzgV2FBO+Q/Rxr3Ni7g9SKWVfxcC5+3Mg3wp
	z48wyTRbi4tUgBkZRko06XksB5JSlBeDeLOX3dG0MdImH6jgQNi8lz7gmgDrBhB5VUcA
	TQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1B0lELIZzHoZuc/EWs1IySTiVYo63N+j2GW7t7Mhc2Y=;
	b=r0O1UY0EyJDN9GZiq7jqLH51bMTNpyvjI6nhkhpkEKu48mEVH+YIdJ1wFpspvhxHTH
	FFS2gNk/yBHuCfCJ83o5y5dD7OOGlY+9VBUnUul/IauFQJssR11IdXgQ2/hDiQRUuiGx
	H4NdkSE9NDDCjFjhguE3sb557AwVkXlR9C9EPKHKHcrItLAKgSAL5g/eJoLiNK1Bi2p1
	0BCkEg7r9+Qgv95XSPqxYsJXPMK54zFu43JyATJqz8LWpVkN6xwV31JmpXIwUnVaIX0F
	zbrXcVztinoyA3bcXSxahPfrih/qNpOHodbHQDL8+7BEnjBp9iM9DTION4GIXo8ik1Oo
	mmDw==
X-Gm-Message-State: AMke39k/VqlIfW7351xpIsxbbDzjxvkgVv3z1XVpsr357Q/tkbT1lZ3j/SGjaRHW6YdAcv+X1fKC2ogbkbUxaw==
X-Received: by 10.36.52.197 with SMTP id z188mr14527067itz.71.1486828675192;
	Sat, 11 Feb 2017 07:57:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.142.205 with HTTP; Sat, 11 Feb 2017 07:57:54 -0800 (PST)
From: nitish jha <nitishjha16@gmail.com>
Date: Sat, 11 Feb 2017 16:57:54 +0100
Message-ID: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Error Building xen-image-minimal
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Feb 2017 15:58:02 -0000
Content-Type: multipart/alternative; boundary=001a113ac1bc06e3fe05484347d2

--001a113ac1bc06e3fe05484347d2
Content-Type: text/plain; charset=UTF-8

Hello All,

I am tryin to build xen-image-minimal

but I am getting following error

ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:
Files/directories were installed but not shipped in any package:
  /usr/lib/gconv/ISO8859-5.so
  /usr/lib/gconv/CP772.so
  /usr/lib/gconv/IBM1155.so
  /usr/lib/gconv/EBCDIC-AT-DE-A.so
  /usr/lib/gconv/CP775.so
  /usr/lib/gconv/ISO-IR-197.so
  /usr/lib/gconv/EBCDIC-FI-SE-A.so
  /usr/lib/gconv/DEC-MCS.so
  /usr/lib/gconv/IBM871.so
  /usr/lib/gconv/IBM1132.so
  /usr/lib/gconv/EBCDIC-FR.so
  /usr/lib/gconv/IBM038.so
  /usr/lib/gconv/IBM1133.so
  /usr/lib/gconv/CP10007.so
  /usr/lib/gconv/UTF-16.so
  /usr/lib/gconv/IBM424.so
  /usr/lib/gconv/IBM1140.so
  /usr/lib/gconv/IBM423.so
  /usr/lib/gconv/EUC-CN.so
  /usr/lib/gconv/CP1125.so
  /usr/lib/gconv/IBM850.so
  /usr/lib/gconv/KOI8-R.so
  /usr/lib/gconv/MAC-SAMI.so
  /usr/lib/gconv/IBM1122.so
  /usr/lib/gconv/IBM1156.so
  /usr/lib/gconv/IBM275.so
  /usr/lib/gconv/IBM500.so
  /usr/lib/gconv/CP737.so
  /usr/lib/gconv/IBM921.so
  /usr/lib/gconv/CP1257.so
  /usr/lib/gconv/IBM862.so
  /usr/lib/gconv/IBM1146.so
  /usr/lib/gconv/EBCDIC-DK-NO-A.so
  /usr/lib/gconv/MACINTOSH.so
  /usr/lib/gconv/IBM1163.so
  /usr/lib/gconv/IBM1112.so
  /usr/lib/gconv/IBM1097.so
  /usr/lib/gconv/EBCDIC-PT.so
  /usr/lib/gconv/IBM901.so
  /usr/lib/gconv/IBM903.so
  /usr/lib/gconv/CP932.so
  /usr/lib/gconv/IBM281.so
  /usr/lib/gconv/IBM256.so
  /usr/lib/gconv/IBM9448.so
  /usr/lib/gconv/IBM930.so
  /usr/lib/gconv/BIG5HKSCS.so
  /usr/lib/gconv/IBM1123.so
  /usr/lib/gconv/ISO8859-10.so
  /usr/lib/gconv/EBCDIC-ES-A.so
  /usr/lib/gconv/CP1254.so
  /usr/lib/gconv/IBM1153.so
  /usr/lib/gconv/UTF-7.so
  /usr/lib/gconv/IBM865.so
  /usr/lib/gconv/IBM9030.so
  /usr/lib/gconv/ISO_10367-BOX.so
  /usr/lib/gconv/GEORGIAN-ACADEMY.so
  /usr/lib/gconv/ISO_2033.so
  /usr/lib/gconv/CP1252.so
  /usr/lib/gconv/LATIN-GREEK.so
  /usr/lib/gconv/IBM1008.so
  /usr/lib/gconv/TCVN5712-1.so
  /usr/lib/gconv/IBM1046.so
  /usr/lib/gconv/EBCDIC-ES-S.so
  /usr/lib/gconv/ISO-IR-209.so
  /usr/lib/gconv/EUC-KR.so
  /usr/lib/gconv/EBCDIC-IS-FRISS.so
  /usr/lib/gconv/ISO8859-2.so
  /usr/lib/gconv/IBM1388.so
  /usr/lib/gconv/IBM803.so
  /usr/lib/gconv/IBM1129.so
  /usr/lib/gconv/TIS-620.so
  /usr/lib/gconv/ARMSCII-8.so
  /usr/lib/gconv/PT154.so
  /usr/lib/gconv/IBM290.so
  /usr/lib/gconv/IBM16804.so
  /usr/lib/gconv/IBM5347.so
  /usr/lib/gconv/IBM284.so
  /usr/lib/gconv/EBCDIC-FI-SE.so
  /usr/lib/gconv/IBM869.so
  /usr/lib/gconv/IBM1025.so
  /usr/lib/gconv/HP-TURKISH8.so
  /usr/lib/gconv/KOI-8.so
  /usr/lib/gconv/IBM1162.so
  /usr/lib/gconv/ISO646.so
  /usr/lib/gconv/ISO8859-13.so
  /usr/lib/gconv/VISCII.so
  /usr/lib/gconv/ISO8859-1.so
  /usr/lib/gconv/IBM932.so
  /usr/lib/gconv/SAMI-WS2.so
  /usr/lib/gconv/EBCDIC-UK.so
  /usr/lib/gconv/IBM1364.so
  /usr/lib/gconv/EUC-JISX0213.so
  /usr/lib/gconv/IBM297.so
  /usr/lib/gconv/ISO8859-15.so
  /usr/lib/gconv/IEC_P27-1.so
  /usr/lib/gconv/IBM277.so
  /usr/lib/gconv/IBM904.so
  /usr/lib/gconv/EUC-JP-MS.so
  /usr/lib/gconv/CP1251.so
  /usr/lib/gconv/ISO8859-9E.so
  /usr/lib/gconv/IBM1149.so
  /usr/lib/gconv/IBM902.so
  /usr/lib/gconv/EBCDIC-US.so
  /usr/lib/gconv/ISO8859-9.so
  /usr/lib/gconv/IBM9066.so
  /usr/lib/gconv/IBM037.so
  /usr/lib/gconv/CP1255.so
  /usr/lib/gconv/IBM851.so
  /usr/lib/gconv/UNICODE.so
  /usr/lib/gconv/IBM860.so
  /usr/lib/gconv/RK1048.so
  /usr/lib/gconv/IBM861.so
  /usr/lib/gconv/ISO_5427-EXT.so
  /usr/lib/gconv/EUC-TW.so
  /usr/lib/gconv/MAC-CENTRALEUROPE.so
  /usr/lib/gconv/ISO_11548-1.so
  /usr/lib/gconv/ISO-2022-CN-EXT.so
  /usr/lib/gconv/IBM874.so
  /usr/lib/gconv/ISO-2022-JP.so
  /usr/lib/gconv/ISO_5427.so
  /usr/lib/gconv/ISO_6937-2.so
  /usr/lib/gconv/EBCDIC-CA-FR.so
  /usr/lib/gconv/GEORGIAN-PS.so
  /usr/lib/gconv/HP-THAI8.so
  /usr/lib/gconv/IBM852.so
  /usr/lib/gconv/ISO8859-3.so
  /usr/lib/gconv/libKSC.so
  /usr/lib/gconv/HP-ROMAN9.so
  /usr/lib/gconv/IBM857.so
  /usr/lib/gconv/IBM420.so
  /usr/lib/gconv/IBM12712.so
  /usr/lib/gconv/IBM273.so
  /usr/lib/gconv/IBM1142.so
  /usr/lib/gconv/MAC-IS.so
  /usr/lib/gconv/IBM1157.so
  /usr/lib/gconv/ISIRI-3342.so
  /usr/lib/gconv/IBM1144.so
  /usr/lib/gconv/IBM1147.so
  /usr/lib/gconv/IBM285.so
  /usr/lib/gconv/IBM866.so
  /usr/lib/gconv/IBM880.so
  /usr/lib/gconv/IBM4909.so
  /usr/lib/gconv/libCNS.so
  /usr/lib/gconv/CP1253.so
  /usr/lib/gconv/ISO8859-8.so
  /usr/lib/gconv/IBM1141.so
  /usr/lib/gconv/INIS-8.so
  /usr/lib/gconv/ECMA-CYRILLIC.so
  /usr/lib/gconv/GBK.so
  /usr/lib/gconv/EBCDIC-AT-DE.so
  /usr/lib/gconv/IBM1167.so
  /usr/lib/gconv/T.61.so
  /usr/lib/gconv/IBM280.so
  /usr/lib/gconv/NATS-SEFI.so
  /usr/lib/gconv/IBM918.so
  /usr/lib/gconv/ISO-2022-CN.so
  /usr/lib/gconv/GB18030.so
  /usr/lib/gconv/IBM943.so
  /usr/lib/gconv/ASMO_449.so
  /usr/lib/gconv/GOST_19768-74.so
  /usr/lib/gconv/IBM870.so
  /usr/lib/gconv/IBM868.so
  /usr/lib/gconv/INIS.so
  /usr/lib/gconv/IBM1145.so
  /usr/lib/gconv/CP1258.so
  /usr/lib/gconv/ISO8859-7.so
  /usr/lib/gconv/IBM4517.so
  /usr/lib/gconv/CP770.so
  /usr/lib/gconv/IBM875.so
  /usr/lib/gconv/ISO_5428.so
  /usr/lib/gconv/IBM866NAV.so
  /usr/lib/gconv/ISO-2022-JP-3.so
  /usr/lib/gconv/HP-ROMAN8.so
  /usr/lib/gconv/IBM1143.so
  /usr/lib/gconv/IBM937.so
  /usr/lib/gconv/KOI8-RU.so
  /usr/lib/gconv/IBM922.so
  /usr/lib/gconv/NATS-DANO.so
  /usr/lib/gconv/IBM1004.so
  /usr/lib/gconv/IBM905.so
  /usr/lib/gconv/CP773.so
  /usr/lib/gconv/GREEK-CCITT.so
  /usr/lib/gconv/KOI8-T.so
  /usr/lib/gconv/ISO-2022-KR.so
  /usr/lib/gconv/UHC.so
  /usr/lib/gconv/MAC-UK.so
  /usr/lib/gconv/libGB.so
  /usr/lib/gconv/ISO8859-6.so
  /usr/lib/gconv/IBM274.so
  /usr/lib/gconv/GBBIG5.so
  /usr/lib/gconv/IBM891.so
  /usr/lib/gconv/IBM939.so
  /usr/lib/gconv/IBM1130.so
  /usr/lib/gconv/EBCDIC-IT.so
  /usr/lib/gconv/KOI8-U.so
  /usr/lib/gconv/IBM278.so
  /usr/lib/gconv/ISO_6937.so
  /usr/lib/gconv/IBM437.so
  /usr/lib/gconv/IBM1026.so
  /usr/lib/gconv/UTF-32.so
  /usr/lib/gconv/CP1256.so
  /usr/lib/gconv/EBCDIC-ES.so
  /usr/lib/gconv/IBM933.so
  /usr/lib/gconv/ISO8859-11.so
  /usr/lib/gconv/IBM935.so
  /usr/lib/gconv/IBM1124.so
  /usr/lib/gconv/LATIN-GREEK-1.so
  /usr/lib/gconv/CSN_369103.so
  /usr/lib/gconv/BIG5.so
  /usr/lib/gconv/IBM1137.so
  /usr/lib/gconv/EUC-JP.so
  /usr/lib/gconv/CWI.so
  /usr/lib/gconv/IBM1160.so
  /usr/lib/gconv/IBM864.so
  /usr/lib/gconv/CP1250.so
  /usr/lib/gconv/libJIS.so
  /usr/lib/gconv/IBM1166.so
  /usr/lib/gconv/IBM1164.so
  /usr/lib/gconv/ANSI_X3.110.so
  /usr/lib/gconv/IBM4971.so
  /usr/lib/gconv/GREEK7.so
  /usr/lib/gconv/SHIFT_JISX0213.so
  /usr/lib/gconv/libISOIR165.so
  /usr/lib/gconv/EBCDIC-DK-NO.so
  /usr/lib/gconv/IBM1371.so
  /usr/lib/gconv/gconv-modules
  /usr/lib/gconv/ISO8859-14.so
  /usr/lib/gconv/GBGBK.so
  /usr/lib/gconv/IBM855.so
  /usr/lib/gconv/IBM1154.so
  /usr/lib/gconv/INIS-CYRILLIC.so
  /usr/lib/gconv/IBM856.so
  /usr/lib/gconv/ISO8859-16.so
  /usr/lib/gconv/SJIS.so
  /usr/lib/gconv/CP774.so
  /usr/lib/gconv/GREEK7-OLD.so
  /usr/lib/gconv/IBM863.so
  /usr/lib/gconv/IBM1008_420.so
  /usr/lib/gconv/IBM1161.so
  /usr/lib/gconv/IBM1047.so
  /usr/lib/gconv/libJISX0213.so
  /usr/lib/gconv/MIK.so
  /usr/lib/gconv/JOHAB.so
  /usr/lib/gconv/IBM1390.so
  /usr/lib/gconv/IBM1399.so
  /usr/lib/gconv/CP771.so
  /usr/lib/gconv/IBM1158.so
  /usr/lib/gconv/TSCII.so
  /usr/lib/gconv/ISO8859-4.so
  /usr/lib/gconv/IBM1148.so
  /usr/lib/gconv/BRF.so
  /usr/lib/gconv/IBM4899.so
  /usr/lib/gconv/HP-GREEK8.so
  /usr/share/i18n
  /usr/share/i18n/charmaps
  /usr/share/i18n/locales
  /usr/share/i18n/charmaps/JUS_I.B1.003-MAC.gz
  /usr/share/i18n/charmaps/IBM1160.gz
  /usr/share/i18n/charmaps/CP1253.gz
  /usr/share/i18n/charmaps/IBM870.gz
  /usr/share/i18n/charmaps/WINDOWS-31J.gz
  /usr/share/i18n/charmaps/ISO-IR-197.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD.gz
  /usr/share/i18n/charmaps/SEN_850200_B.gz
  /usr/share/i18n/charmaps/IBM038.gz
  /usr/share/i18n/charmaps/IBM284.gz
  /usr/share/i18n/charmaps/ANSI_X3.110-1983.gz
  /usr/share/i18n/charmaps/NF_Z_62-010_1973.gz
  /usr/share/i18n/charmaps/ARMSCII-8.gz
  /usr/share/i18n/charmaps/BIG5-HKSCS.gz
  /usr/share/i18n/charmaps/IBM1026.gz
  /usr/share/i18n/charmaps/PT.gz
  /usr/share/i18n/charmaps/IBM903.gz
  /usr/share/i18n/charmaps/MAC-IS.gz
  /usr/share/i18n/charmaps/INIS-8.gz
  /usr/share/i18n/charmaps/JIS_X0201.gz
  /usr/share/i18n/charmaps/ISO-8859-7.gz
  /usr/share/i18n/charmaps/IBM281.gz
  /usr/share/i18n/charmaps/BS_VIEWDATA.gz
  /usr/share/i18n/charmaps/IBM1162.gz
  /usr/share/i18n/charmaps/ISO_5427.gz
  /usr/share/i18n/charmaps/EBCDIC-UK.gz
  /usr/share/i18n/charmaps/EBCDIC-ES.gz
  /usr/share/i18n/charmaps/EBCDIC-DK-NO-A.gz
  /usr/share/i18n/charmaps/NS_4551-2.gz
  /usr/share/i18n/charmaps/ISO-8859-8.gz
  /usr/share/i18n/charmaps/IBM1133.gz
  /usr/share/i18n/charmaps/KOI8-T.gz
  /usr/share/i18n/charmaps/HP-ROMAN8.gz
  /usr/share/i18n/charmaps/MAC-UK.gz
  /usr/share/i18n/charmaps/IBM866NAV.gz
  /usr/share/i18n/charmaps/ISO-8859-6.gz
  /usr/share/i18n/charmaps/CP773.gz
  /usr/share/i18n/charmaps/MSZ_7795.3.gz
  /usr/share/i18n/charmaps/EBCDIC-ES-S.gz
  /usr/share/i18n/charmaps/IBM277.gz
  /usr/share/i18n/charmaps/IBM868.gz
  /usr/share/i18n/charmaps/ISO_10367-BOX.gz
  /usr/share/i18n/charmaps/ISO-8859-13.gz
  /usr/share/i18n/charmaps/INIS.gz
  /usr/share/i18n/charmaps/IBM273.gz
  /usr/share/i18n/charmaps/NATS-DANO-ADD.gz
  /usr/share/i18n/charmaps/NATS-DANO.gz
  /usr/share/i18n/charmaps/EUC-JP-MS.gz
  /usr/share/i18n/charmaps/ISO-8859-3.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-A.gz
  /usr/share/i18n/charmaps/IEC_P27-1.gz
  /usr/share/i18n/charmaps/BRF.gz
  /usr/share/i18n/charmaps/IBM424.gz
  /usr/share/i18n/charmaps/IBM864.gz
  /usr/share/i18n/charmaps/SEN_850200_C.gz
  /usr/share/i18n/charmaps/ISO_8859-SUPP.gz
  /usr/share/i18n/charmaps/EUC-TW.gz
  /usr/share/i18n/charmaps/ISO_646.BASIC.gz
  /usr/share/i18n/charmaps/KSC5636.gz
  /usr/share/i18n/charmaps/IBM290.gz
  /usr/share/i18n/charmaps/ISO-8859-2.gz
  /usr/share/i18n/charmaps/EBCDIC-IS-FRISS.gz
  /usr/share/i18n/charmaps/UTF-8.gz
  /usr/share/i18n/charmaps/EUC-JISX0213.gz
  /usr/share/i18n/charmaps/SHIFT_JIS.gz
  /usr/share/i18n/charmaps/NC_NC00-10.gz
  /usr/share/i18n/charmaps/IBM500.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-GR.gz
  /usr/share/i18n/charmaps/IBM874.gz
  /usr/share/i18n/charmaps/KOI8-RU.gz
  /usr/share/i18n/charmaps/IBM037.gz
  /usr/share/i18n/charmaps/ISO-8859-5.gz
  /usr/share/i18n/charmaps/IBM865.gz
  /usr/share/i18n/charmaps/T.61-7BIT.gz
  /usr/share/i18n/charmaps/ISO_5427-EXT.gz
  /usr/share/i18n/charmaps/IBM1004.gz
  /usr/share/i18n/charmaps/T.101-G2.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-2.gz
  /usr/share/i18n/charmaps/RK1048.gz
  /usr/share/i18n/charmaps/EUC-KR.gz
  /usr/share/i18n/charmaps/IBM1161.gz
  /usr/share/i18n/charmaps/IBM1164.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND.gz
  /usr/share/i18n/charmaps/HP-THAI8.gz
  /usr/share/i18n/charmaps/IBM905.gz
  /usr/share/i18n/charmaps/DS_2089.gz
  /usr/share/i18n/charmaps/PT154.gz
  /usr/share/i18n/charmaps/CP1257.gz
  /usr/share/i18n/charmaps/TSCII.gz
  /usr/share/i18n/charmaps/IBM866.gz
  /usr/share/i18n/charmaps/EBCDIC-PT.gz
  /usr/share/i18n/charmaps/IBM860.gz
  /usr/share/i18n/charmaps/NF_Z_62-010.gz
  /usr/share/i18n/charmaps/SAMI.gz
  /usr/share/i18n/charmaps/IBM297.gz
  /usr/share/i18n/charmaps/MAC-CENTRALEUROPE.gz
  /usr/share/i18n/charmaps/CP1254.gz
  /usr/share/i18n/charmaps/CP774.gz
  /usr/share/i18n/charmaps/CP772.gz
  /usr/share/i18n/charmaps/CP1256.gz
  /usr/share/i18n/charmaps/ISO-8859-1.gz
  /usr/share/i18n/charmaps/ES2.gz
  /usr/share/i18n/charmaps/BIG5.gz
  /usr/share/i18n/charmaps/CP1255.gz
  /usr/share/i18n/charmaps/ISO_8859-1,GL.gz
  /usr/share/i18n/charmaps/SHIFT_JISX0213.gz
  /usr/share/i18n/charmaps/LATIN-GREEK-1.gz
  /usr/share/i18n/charmaps/ANSI_X3.4-1968.gz
  /usr/share/i18n/charmaps/IBM862.gz
  /usr/share/i18n/charmaps/IBM857.gz
  /usr/share/i18n/charmaps/ISO-8859-16.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-KANA.gz
  /usr/share/i18n/charmaps/ISO-8859-14.gz
  /usr/share/i18n/charmaps/HP-ROMAN9.gz
  /usr/share/i18n/charmaps/CWI.gz
  /usr/share/i18n/charmaps/ISO_2033-1983.gz
  /usr/share/i18n/charmaps/IBM256.gz
  /usr/share/i18n/charmaps/ISO_646.IRV.gz
  /usr/share/i18n/charmaps/IBM875.gz
  /usr/share/i18n/charmaps/IBM1132.gz
  /usr/share/i18n/charmaps/VISCII.gz
  /usr/share/i18n/charmaps/IBM852.gz
  /usr/share/i18n/charmaps/GREEK-CCITT.gz
  /usr/share/i18n/charmaps/DIN_66003.gz
  /usr/share/i18n/charmaps/HP-TURKISH8.gz
  /usr/share/i18n/charmaps/IBM856.gz
  /usr/share/i18n/charmaps/EBCDIC-FI-SE.gz
  /usr/share/i18n/charmaps/ISO_6937-2-ADD.gz
  /usr/share/i18n/charmaps/IBM423.gz
  /usr/share/i18n/charmaps/CSN_369103.gz
  /usr/share/i18n/charmaps/EBCDIC-AT-DE-A.gz
  /usr/share/i18n/charmaps/ISO-IR-90.gz
  /usr/share/i18n/charmaps/IBM922.gz
  /usr/share/i18n/charmaps/IBM1124.gz
  /usr/share/i18n/charmaps/GREEK7-OLD.gz
  /usr/share/i18n/charmaps/IBM1163.gz
  /usr/share/i18n/charmaps/BS_4730.gz
  /usr/share/i18n/charmaps/CP10007.gz
  /usr/share/i18n/charmaps/INVARIANT.gz
  /usr/share/i18n/charmaps/EBCDIC-FI-SE-A.gz
  /usr/share/i18n/charmaps/ISO-8859-9.gz
  /usr/share/i18n/charmaps/IBM437.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-B.gz
  /usr/share/i18n/charmaps/JIS_C6220-1969-JP.gz
  /usr/share/i18n/charmaps/CP1258.gz
  /usr/share/i18n/charmaps/VIDEOTEX-SUPPL.gz
  /usr/share/i18n/charmaps/HP-GREEK8.gz
  /usr/share/i18n/charmaps/EBCDIC-FR.gz
  /usr/share/i18n/charmaps/ISO-8859-4.gz
  /usr/share/i18n/charmaps/CP737.gz
  /usr/share/i18n/charmaps/GEORGIAN-PS.gz
  /usr/share/i18n/charmaps/EBCDIC-CA-FR.gz
  /usr/share/i18n/charmaps/NEXTSTEP.gz
  /usr/share/i18n/charmaps/MAC-SAMI.gz
  /usr/share/i18n/charmaps/GB2312.gz
  /usr/share/i18n/charmaps/IBM863.gz
  /usr/share/i18n/charmaps/IBM850.gz
  /usr/share/i18n/charmaps/MACINTOSH.gz
  /usr/share/i18n/charmaps/IBM891.gz
  /usr/share/i18n/charmaps/DEC-MCS.gz
  /usr/share/i18n/charmaps/NS_4551-1.gz
  /usr/share/i18n/charmaps/ISO-8859-15.gz
  /usr/share/i18n/charmaps/LATIN-GREEK.gz
  /usr/share/i18n/charmaps/GB_1988-80.gz
  /usr/share/i18n/charmaps/MAC-CYRILLIC.gz
  /usr/share/i18n/charmaps/EBCDIC-ES-A.gz
  /usr/share/i18n/charmaps/EUC-JP.gz
  /usr/share/i18n/charmaps/JUS_I.B1.003-SERB.gz
  /usr/share/i18n/charmaps/TIS-620.gz
  /usr/share/i18n/charmaps/CSA_Z243.4-1985-1.gz
  /usr/share/i18n/charmaps/IBM918.gz
  /usr/share/i18n/charmaps/ISO-8859-9E.gz
  /usr/share/i18n/charmaps/ISIRI-3342.gz
  /usr/share/i18n/charmaps/IBM861.gz
  /usr/share/i18n/charmaps/KOI8-U.gz
  /usr/share/i18n/charmaps/GOST_19768-74.gz
  /usr/share/i18n/charmaps/SAMI-WS2.gz
  /usr/share/i18n/charmaps/ISO-8859-10.gz
  /usr/share/i18n/charmaps/ISO_6937.gz
  /usr/share/i18n/charmaps/PT2.gz
  /usr/share/i18n/charmaps/CP1125.gz
  /usr/share/i18n/charmaps/ISO-IR-209.gz
  /usr/share/i18n/charmaps/ISO_11548-1.gz
  /usr/share/i18n/charmaps/CP1250.gz
  /usr/share/i18n/charmaps/IBM1047.gz
  /usr/share/i18n/charmaps/INIS-CYRILLIC.gz
  /usr/share/i18n/charmaps/IBM274.gz
  /usr/share/i18n/charmaps/T.61-8BIT.gz
  /usr/share/i18n/charmaps/IBM285.gz
  /usr/share/i18n/charmaps/NATS-SEFI-ADD.gz
  /usr/share/i18n/charmaps/IBM278.gz
  /usr/share/i18n/charmaps/JUS_I.B1.002.gz
  /usr/share/i18n/charmaps/CP1252.gz
  /usr/share/i18n/charmaps/EBCDIC-DK-NO.gz
  /usr/share/i18n/charmaps/KOI8-R.gz
  /usr/share/i18n/charmaps/CP949.gz
  /usr/share/i18n/charmaps/ISO_10646.gz
  /usr/share/i18n/charmaps/CP770.gz
  /usr/share/i18n/charmaps/ISO_5428.gz
  /usr/share/i18n/charmaps/IBM420.gz
  /usr/share/i18n/charmaps/EBCDIC-AT-DE.gz
  /usr/share/i18n/charmaps/ASMO_449.gz
  /usr/share/i18n/charmaps/CP771.gz
  /usr/share/i18n/charmaps/IBM1129.gz
  /usr/share/i18n/charmaps/GBK.gz
  /usr/share/i18n/charmaps/IBM904.gz
  /usr/share/i18n/charmaps/TCVN5712-1.gz
  /usr/share/i18n/charmaps/ISO_6937-2-25.gz
  /usr/share/i18n/charmaps/KOI-8.gz
  /usr/share/i18n/charmaps/EBCDIC-IT.gz
  /usr/share/i18n/charmaps/JIS_C6229-1984-HAND-ADD.gz
  /usr/share/i18n/charmaps/NATS-SEFI.gz
  /usr/share/i18n/charmaps/IBM851.gz
  /usr/share/i18n/charmaps/MIK.gz
  /usr/share/i18n/charmaps/ECMA-CYRILLIC.gz
  /usr/share/i18n/charmaps/IBM869.gz
  /usr/share/i18n/charmaps/GREEK7.gz
  /usr/share/i18n/charmaps/IBM280.gz
  /usr/share/i18n/charmaps/JOHAB.gz
  /usr/share/i18n/charmaps/EBCDIC-US.gz
  /usr/share/i18n/charmaps/ES.gz
  /usr/share/i18n/charmaps/ISO-8859-11.gz
  /usr/share/i18n/charmaps/GB18030.gz
  /usr/share/i18n/charmaps/IBM871.gz
  /usr/share/i18n/charmaps/IBM880.gz
  /usr/share/i18n/charmaps/CP775.gz
  /usr/share/i18n/charmaps/IT.gz
  /usr/share/i18n/charmaps/IBM855.gz
  /usr/share/i18n/charmaps/GEORGIAN-ACADEMY.gz
  /usr/share/i18n/charmaps/IBM275.gz
  /usr/share/i18n/charmaps/JIS_C6220-1969-RO.gz
  /usr/share/i18n/charmaps/CP1251.gz
  /usr/share/i18n/locales/es_ES@euro
  /usr/share/i18n/locales/zh_HK
  /usr/share/i18n/locales/de_DE
  /usr/share/i18n/locales/ar_OM
  /usr/share/i18n/locales/nds_DE
  /usr/share/i18n/locales/yo_NG
  /usr/share/i18n/locales/fy_DE
  /usr/share/i18n/locales/th_TH
  /usr/share/i18n/locales/fo_FO
  /usr/share/i18n/locales/pa_IN
  /usr/share/i18n/locales/zh_TW
  /usr/share/i18n/locales/ar_BH
  /usr/share/i18n/locales/lt_LT
  /usr/share/i18n/locales/ff_SN
  /usr/share/i18n/locales/ur_PK
  /usr/share/i18n/locales/he_IL
  /usr/share/i18n/locales/sr_RS
  /usr/share/i18n/locales/br_FR@euro
  /usr/share/i18n/locales/es_PE
  /usr/share/i18n/locales/en_DK
  /usr/share/i18n/locales/nr_ZA
  /usr/share/i18n/locales/it_IT
  /usr/share/i18n/locales/ar_YE
  /usr/share/i18n/locales/bem_ZM
  /usr/share/i18n/locales/aa_ER@saaho
  /usr/share/i18n/locales/iso14651_t1
  /usr/share/i18n/locales/es_ES
  /usr/share/i18n/locales/es_MX
  /usr/share/i18n/locales/en_BW
  /usr/share/i18n/locales/sv_FI
  /usr/share/i18n/locales/crh_UA
  /usr/share/i18n/locales/sgs_LT
  /usr/share/i18n/locales/el_GR
  /usr/share/i18n/locales/en_IE
  /usr/share/i18n/locales/br_FR
  /usr/share/i18n/locales/ar_LY
  /usr/share/i18n/locales/en_SG
  /usr/share/i18n/locales/translit_cjk_variants
  /usr/share/i18n/locales/en_AU
  /usr/share/i18n/locales/ha_NG
  /usr/share/i18n/locales/nl_AW
  /usr/share/i18n/locales/de_BE@euro
  /usr/share/i18n/locales/uz_UZ
  /usr/share/i18n/locales/en_ZA
  /usr/share/i18n/locales/tig_ER
  /usr/share/i18n/locales/fi_FI
  /usr/share/i18n/locales/ml_IN
  /usr/share/i18n/locales/nan_TW
  /usr/share/i18n/locales/nds_NL
  /usr/share/i18n/locales/ps_AF
  /usr/share/i18n/locales/sa_IN
  /usr/share/i18n/locales/ber_MA
  /usr/share/i18n/locales/ht_HT
  /usr/share/i18n/locales/en_ZM
  /usr/share/i18n/locales/gu_IN
  /usr/share/i18n/locales/ug_CN
  /usr/share/i18n/locales/fi_FI@euro
  /usr/share/i18n/locales/translit_small
  /usr/share/i18n/locales/aa_ET
  /usr/share/i18n/locales/sr_RS@latin
  /usr/share/i18n/locales/en_PH
  /usr/share/i18n/locales/ca_ES@euro
  /usr/share/i18n/locales/en_AG
  /usr/share/i18n/locales/it_CH
  /usr/share/i18n/locales/sv_FI@euro
  /usr/share/i18n/locales/fy_NL
  /usr/share/i18n/locales/nl_BE
  /usr/share/i18n/locales/doi_IN
  /usr/share/i18n/locales/gez_ER@abegede
  /usr/share/i18n/locales/shs_CA
  /usr/share/i18n/locales/tk_TM
  /usr/share/i18n/locales/st_ZA
  /usr/share/i18n/locales/be_BY@latin
  /usr/share/i18n/locales/szl_PL
  /usr/share/i18n/locales/sw_TZ
  /usr/share/i18n/locales/lb_LU
  /usr/share/i18n/locales/fr_FR
  /usr/share/i18n/locales/ar_MA
  /usr/share/i18n/locales/cy_GB
  /usr/share/i18n/locales/es_VE
  /usr/share/i18n/locales/km_KH
  /usr/share/i18n/locales/mn_MN
  /usr/share/i18n/locales/sat_IN
  /usr/share/i18n/locales/sw_KE
  /usr/share/i18n/locales/nl_NL
  /usr/share/i18n/locales/lij_IT
  /usr/share/i18n/locales/ar_IN
  /usr/share/i18n/locales/ar_DZ
  /usr/share/i18n/locales/en_NG
  /usr/share/i18n/locales/vi_VN
  /usr/share/i18n/locales/hr_HR
  /usr/share/i18n/locales/da_DK
  /usr/share/i18n/locales/es_GT
  /usr/share/i18n/locales/chr_US
  /usr/share/i18n/locales/lo_LA
  /usr/share/i18n/locales/pa_PK
  /usr/share/i18n/locales/ast_ES
  /usr/share/i18n/locales/tn_ZA
  /usr/share/i18n/locales/rw_RW
  /usr/share/i18n/locales/dv_MV
  /usr/share/i18n/locales/bs_BA
  /usr/share/i18n/locales/ka_GE
  /usr/share/i18n/locales/en_GB
  /usr/share/i18n/locales/nl_NL@euro
  /usr/share/i18n/locales/ca_FR
  /usr/share/i18n/locales/ce_RU
  /usr/share/i18n/locales/de_IT
  /usr/share/i18n/locales/ti_ET
  /usr/share/i18n/locales/lzh_TW
  /usr/share/i18n/locales/bhb_IN
  /usr/share/i18n/locales/ig_NG
  /usr/share/i18n/locales/de_LU@euro
  /usr/share/i18n/locales/en_IL
  /usr/share/i18n/locales/gl_ES
  /usr/share/i18n/locales/ln_CD
  /usr/share/i18n/locales/sr_ME
  /usr/share/i18n/locales/gl_ES@euro
  /usr/share/i18n/locales/bn_BD
  /usr/share/i18n/locales/translit_circle
  /usr/share/i18n/locales/aa_DJ
  /usr/share/i18n/locales/ru_UA
  /usr/share/i18n/locales/mk_MK
  /usr/share/i18n/locales/iso14651_t1_common
  /usr/share/i18n/locales/tt_RU
  /usr/share/i18n/locales/ar_SS
  /usr/share/i18n/locales/pt_PT@euro
  /usr/share/i18n/locales/lv_LV
  /usr/share/i18n/locales/fr_CH
  /usr/share/i18n/locales/translit_font
  /usr/share/i18n/locales/es_UY
  /usr/share/i18n/locales/fr_LU
  /usr/share/i18n/locales/anp_IN
  /usr/share/i18n/locales/de_DE@euro
  /usr/share/i18n/locales/nb_NO
  /usr/share/i18n/locales/pl_PL
  /usr/share/i18n/locales/ar_SY
  /usr/share/i18n/locales/ms_MY
  /usr/share/i18n/locales/sid_ET
  /usr/share/i18n/locales/bn_IN
  /usr/share/i18n/locales/es_CU
  /usr/share/i18n/locales/gd_GB
  /usr/share/i18n/locales/yue_HK
  /usr/share/i18n/locales/the_NP
  /usr/share/i18n/locales/hi_IN
  /usr/share/i18n/locales/hy_AM
  /usr/share/i18n/locales/ar_SD
  /usr/share/i18n/locales/zh_CN
  /usr/share/i18n/locales/zh_SG
  /usr/share/i18n/locales/wo_SN
  /usr/share/i18n/locales/hne_IN
  /usr/share/i18n/locales/mi_NZ
  /usr/share/i18n/locales/ar_TN
  /usr/share/i18n/locales/es_DO
  /usr/share/i18n/locales/sd_IN@devanagari
  /usr/share/i18n/locales/uk_UA
  /usr/share/i18n/locales/uz_UZ@cyrillic
  /usr/share/i18n/locales/ar_LB
  /usr/share/i18n/locales/id_ID
  /usr/share/i18n/locales/ku_TR
  /usr/share/i18n/locales/gez_ER
  /usr/share/i18n/locales/en_HK
  /usr/share/i18n/locales/sq_AL
  /usr/share/i18n/locales/fr_CA
  /usr/share/i18n/locales/ve_ZA
  /usr/share/i18n/locales/pt_BR
  /usr/share/i18n/locales/ar_JO
  /usr/share/i18n/locales/so_KE
  /usr/share/i18n/locales/eo
  /usr/share/i18n/locales/ber_DZ
  /usr/share/i18n/locales/translit_compat
  /usr/share/i18n/locales/es_EC
  /usr/share/i18n/locales/om_KE
  /usr/share/i18n/locales/ko_KR
  /usr/share/i18n/locales/ar_AE
  /usr/share/i18n/locales/ar_EG
  /usr/share/i18n/locales/ro_RO
  /usr/share/i18n/locales/en_IE@euro
  /usr/share/i18n/locales/es_PR
  /usr/share/i18n/locales/xh_ZA
  /usr/share/i18n/locales/translit_narrow
  /usr/share/i18n/locales/ar_KW
  /usr/share/i18n/locales/niu_NU
  /usr/share/i18n/locales/ks_IN@devanagari
  /usr/share/i18n/locales/nl_BE@euro
  /usr/share/i18n/locales/en_CA
  /usr/share/i18n/locales/kk_KZ
  /usr/share/i18n/locales/aa_ER
  /usr/share/i18n/locales/ta_LK
  /usr/share/i18n/locales/nn_NO
  /usr/share/i18n/locales/nhn_MX
  /usr/share/i18n/locales/de_AT
  /usr/share/i18n/locales/ur_IN
  /usr/share/i18n/locales/my_MM
  /usr/share/i18n/locales/niu_NZ
  /usr/share/i18n/locales/translit_combining
  /usr/share/i18n/locales/ar_QA
  /usr/share/i18n/locales/gez_ET@abegede
  /usr/share/i18n/locales/pt_PT
  /usr/share/i18n/locales/fr_LU@euro
  /usr/share/i18n/locales/es_AR
  /usr/share/i18n/locales/en_ZW
  /usr/share/i18n/locales/gez_ET
  /usr/share/i18n/locales/li_BE
  /usr/share/i18n/locales/so_DJ
  /usr/share/i18n/locales/ar_SA
  /usr/share/i18n/locales/cmn_TW
  /usr/share/i18n/locales/es_PY
  /usr/share/i18n/locales/el_GR@euro
  /usr/share/i18n/locales/as_IN
  /usr/share/i18n/locales/es_PA
  /usr/share/i18n/locales/ss_ZA
  /usr/share/i18n/locales/es_CR
  /usr/share/i18n/locales/es_SV
  /usr/share/i18n/locales/wa_BE@euro
  /usr/share/i18n/locales/so_SO
  /usr/share/i18n/locales/fil_PH
  /usr/share/i18n/locales/ja_JP
  /usr/share/i18n/locales/fr_BE@euro
  /usr/share/i18n/locales/ts_ZA
  /usr/share/i18n/locales/tt_RU@iqtelif
  /usr/share/i18n/locales/ia_FR
  /usr/share/i18n/locales/ayc_PE
  /usr/share/i18n/locales/es_US
  /usr/share/i18n/locales/ti_ER
  /usr/share/i18n/locales/pap_AW
  /usr/share/i18n/locales/ca_AD
  /usr/share/i18n/locales/de_LI
  /usr/share/i18n/locales/hsb_DE
  /usr/share/i18n/locales/nso_ZA
  /usr/share/i18n/locales/mag_IN
  /usr/share/i18n/locales/zu_ZA
  /usr/share/i18n/locales/en_NZ
  /usr/share/i18n/locales/pap_CW
  /usr/share/i18n/locales/unm_US
  /usr/share/i18n/locales/gv_GB
  /usr/share/i18n/locales/kl_GL
  /usr/share/i18n/locales/si_LK
  /usr/share/i18n/locales/te_IN
  /usr/share/i18n/locales/wae_CH
  /usr/share/i18n/locales/tr_TR
  /usr/share/i18n/locales/bg_BG
  /usr/share/i18n/locales/es_HN
  /usr/share/i18n/locales/om_ET
  /usr/share/i18n/locales/de_AT@euro
  /usr/share/i18n/locales/sq_MK
  /usr/share/i18n/locales/quz_PE
  /usr/share/i18n/locales/bho_IN
  /usr/share/i18n/locales/translit_wide
  /usr/share/i18n/locales/fa_IR
  /usr/share/i18n/locales/iu_CA
  /usr/share/i18n/locales/mt_MT
  /usr/share/i18n/locales/translit_fraction
  /usr/share/i18n/locales/ak_GH
  /usr/share/i18n/locales/iso14651_t1_pinyin
  /usr/share/i18n/locales/is_IS
  /usr/share/i18n/locales/so_ET
  /usr/share/i18n/locales/oc_FR
  /usr/share/i18n/locales/mni_IN
  /usr/share/i18n/locales/bo_CN
  /usr/share/i18n/locales/be_BY
  /usr/share/i18n/locales/it_IT@euro
  /usr/share/i18n/locales/tr_CY
  /usr/share/i18n/locales/dz_BT
  /usr/share/i18n/locales/sv_SE
  /usr/share/i18n/locales/ks_IN
  /usr/share/i18n/locales/ne_NP
  /usr/share/i18n/locales/hak_TW
  /usr/share/i18n/locales/am_ET
  /usr/share/i18n/locales/raj_IN
  /usr/share/i18n/locales/af_ZA
  /usr/share/i18n/locales/es_BO
  /usr/share/i18n/locales/mg_MG
  /usr/share/i18n/locales/csb_PL
  /usr/share/i18n/locales/eu_ES@euro
  /usr/share/i18n/locales/fr_BE
  /usr/share/i18n/locales/de_LU
  /usr/share/i18n/locales/ru_RU
  /usr/share/i18n/locales/bo_IN
  /usr/share/i18n/locales/es_CO
  /usr/share/i18n/locales/lg_UG
  /usr/share/i18n/locales/an_ES
  /usr/share/i18n/locales/wal_ET
  /usr/share/i18n/locales/li_NL
  /usr/share/i18n/locales/or_IN
  /usr/share/i18n/locales/eu_ES
  /usr/share/i18n/locales/ik_CA
  /usr/share/i18n/locales/el_CY
  /usr/share/i18n/locales/de_CH
  /usr/share/i18n/locales/sk_SK
  /usr/share/i18n/locales/nan_TW@latin
  /usr/share/i18n/locales/byn_ER
  /usr/share/i18n/locales/en_US
  /usr/share/i18n/locales/ta_IN
  /usr/share/i18n/locales/kok_IN
  /usr/share/i18n/locales/ca_ES
  /usr/share/i18n/locales/fur_IT
  /usr/share/i18n/locales/en_IN
  /usr/share/i18n/locales/es_NI
  /usr/share/i18n/locales/hu_HU
  /usr/share/i18n/locales/yi_US
  /usr/share/i18n/locales/es_CL
  /usr/share/i18n/locales/tcy_IN
  /usr/share/i18n/locales/sc_IT
  /usr/share/i18n/locales/ca_IT
  /usr/share/i18n/locales/et_EE
  /usr/share/i18n/locales/mr_IN
  /usr/share/i18n/locales/mai_IN
  /usr/share/i18n/locales/kn_IN
  /usr/share/i18n/locales/de_BE
  /usr/share/i18n/locales/cs_CZ
  /usr/share/i18n/locales/ga_IE
  /usr/share/i18n/locales/i18n
  /usr/share/i18n/locales/se_NO
  /usr/share/i18n/locales/sd_IN
  /usr/share/i18n/locales/sl_SI
  /usr/share/i18n/locales/mhr_RU
  /usr/share/i18n/locales/ga_IE@euro
  /usr/share/i18n/locales/wa_BE
  /usr/share/i18n/locales/ar_IQ
  /usr/share/i18n/locales/POSIX
  /usr/share/i18n/locales/tg_TJ
  /usr/share/i18n/locales/ky_KG
  /usr/share/i18n/locales/kw_GB
  /usr/share/i18n/locales/translit_neutral
  /usr/share/i18n/locales/os_RU
  /usr/share/i18n/locales/cv_RU
  /usr/share/i18n/locales/translit_hangul
  /usr/share/i18n/locales/brx_IN
  /usr/share/i18n/locales/fr_FR@euro
  /usr/share/i18n/locales/az_AZ
  /usr/share/i18n/locales/translit_cjk_compat
  /usr/share/i18n/locales/tl_PH
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
glibc-locale: 820 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing task.
ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
ERROR: Logfile of failure stored in:
/home/njking/yocto_morty/build_xen_qemu/tmp/work/core2-64-poky-linux/glibc-locale/2.24-r0/temp/log.do_package.17564
ERROR: Task
(/home/njking/yocto_morty/poky/meta/recipes-core/glibc/glibc-locale_2.24.bb:do_package)
failed with exit code '1'


I have added following lines in my local.conf

EXTRA_IMAGE_FEATURES += "ssh-server-openssh"
MACHINE ?= "qemux86-64"
DISTRO_FEATURES += "xen"

Somebody help me to get this issue solved

Thanks
-- 
*Nitish Jha*

--001a113ac1bc06e3fe05484347d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hello All,<br><br></div>I am tryin to =
build xen-image-minimal<br><br></div>but I am getting following error<br><b=
r>ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale: Files/dir=
ectories were installed but not shipped in any package:<br>=C2=A0 /usr/lib/=
gconv/ISO8859-5.so<br>=C2=A0 /usr/lib/gconv/CP772.so<br>=C2=A0 /usr/lib/gco=
nv/IBM1155.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-AT-DE-A.so<br>=C2=A0 /usr/lib=
/gconv/CP775.so<br>=C2=A0 /usr/lib/gconv/ISO-IR-197.so<br>=C2=A0 /usr/lib/g=
conv/EBCDIC-FI-SE-A.so<br>=C2=A0 /usr/lib/gconv/DEC-MCS.so<br>=C2=A0 /usr/l=
ib/gconv/IBM871.so<br>=C2=A0 /usr/lib/gconv/IBM1132.so<br>=C2=A0 /usr/lib/g=
conv/EBCDIC-FR.so<br>=C2=A0 /usr/lib/gconv/IBM038.so<br>=C2=A0 /usr/lib/gco=
nv/IBM1133.so<br>=C2=A0 /usr/lib/gconv/CP10007.so<br>=C2=A0 /usr/lib/gconv/=
UTF-16.so<br>=C2=A0 /usr/lib/gconv/IBM424.so<br>=C2=A0 /usr/lib/gconv/IBM11=
40.so<br>=C2=A0 /usr/lib/gconv/IBM423.so<br>=C2=A0 /usr/lib/gconv/EUC-CN.so=
<br>=C2=A0 /usr/lib/gconv/CP1125.so<br>=C2=A0 /usr/lib/gconv/IBM850.so<br>=
=C2=A0 /usr/lib/gconv/KOI8-R.so<br>=C2=A0 /usr/lib/gconv/MAC-SAMI.so<br>=C2=
=A0 /usr/lib/gconv/IBM1122.so<br>=C2=A0 /usr/lib/gconv/IBM1156.so<br>=C2=A0=
 /usr/lib/gconv/IBM275.so<br>=C2=A0 /usr/lib/gconv/IBM500.so<br>=C2=A0 /usr=
/lib/gconv/CP737.so<br>=C2=A0 /usr/lib/gconv/IBM921.so<br>=C2=A0 /usr/lib/g=
conv/CP1257.so<br>=C2=A0 /usr/lib/gconv/IBM862.so<br>=C2=A0 /usr/lib/gconv/=
IBM1146.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-DK-NO-A.so<br>=C2=A0 /usr/lib/gc=
onv/MACINTOSH.so<br>=C2=A0 /usr/lib/gconv/IBM1163.so<br>=C2=A0 /usr/lib/gco=
nv/IBM1112.so<br>=C2=A0 /usr/lib/gconv/IBM1097.so<br>=C2=A0 /usr/lib/gconv/=
EBCDIC-PT.so<br>=C2=A0 /usr/lib/gconv/IBM901.so<br>=C2=A0 /usr/lib/gconv/IB=
M903.so<br>=C2=A0 /usr/lib/gconv/CP932.so<br>=C2=A0 /usr/lib/gconv/IBM281.s=
o<br>=C2=A0 /usr/lib/gconv/IBM256.so<br>=C2=A0 /usr/lib/gconv/IBM9448.so<br=
>=C2=A0 /usr/lib/gconv/IBM930.so<br>=C2=A0 /usr/lib/gconv/BIG5HKSCS.so<br>=
=C2=A0 /usr/lib/gconv/IBM1123.so<br>=C2=A0 /usr/lib/gconv/ISO8859-10.so<br>=
=C2=A0 /usr/lib/gconv/EBCDIC-ES-A.so<br>=C2=A0 /usr/lib/gconv/CP1254.so<br>=
=C2=A0 /usr/lib/gconv/IBM1153.so<br>=C2=A0 /usr/lib/gconv/UTF-7.so<br>=C2=
=A0 /usr/lib/gconv/IBM865.so<br>=C2=A0 /usr/lib/gconv/IBM9030.so<br>=C2=A0 =
/usr/lib/gconv/ISO_10367-BOX.so<br>=C2=A0 /usr/lib/gconv/GEORGIAN-ACADEMY.s=
o<br>=C2=A0 /usr/lib/gconv/ISO_2033.so<br>=C2=A0 /usr/lib/gconv/CP1252.so<b=
r>=C2=A0 /usr/lib/gconv/LATIN-GREEK.so<br>=C2=A0 /usr/lib/gconv/IBM1008.so<=
br>=C2=A0 /usr/lib/gconv/TCVN5712-1.so<br>=C2=A0 /usr/lib/gconv/IBM1046.so<=
br>=C2=A0 /usr/lib/gconv/EBCDIC-ES-S.so<br>=C2=A0 /usr/lib/gconv/ISO-IR-209=
.so<br>=C2=A0 /usr/lib/gconv/EUC-KR.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-IS-F=
RISS.so<br>=C2=A0 /usr/lib/gconv/ISO8859-2.so<br>=C2=A0 /usr/lib/gconv/IBM1=
388.so<br>=C2=A0 /usr/lib/gconv/IBM803.so<br>=C2=A0 /usr/lib/gconv/IBM1129.=
so<br>=C2=A0 /usr/lib/gconv/TIS-620.so<br>=C2=A0 /usr/lib/gconv/ARMSCII-8.s=
o<br>=C2=A0 /usr/lib/gconv/PT154.so<br>=C2=A0 /usr/lib/gconv/IBM290.so<br>=
=C2=A0 /usr/lib/gconv/IBM16804.so<br>=C2=A0 /usr/lib/gconv/IBM5347.so<br>=
=C2=A0 /usr/lib/gconv/IBM284.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-FI-SE.so<br=
>=C2=A0 /usr/lib/gconv/IBM869.so<br>=C2=A0 /usr/lib/gconv/IBM1025.so<br>=C2=
=A0 /usr/lib/gconv/HP-TURKISH8.so<br>=C2=A0 /usr/lib/gconv/KOI-8.so<br>=C2=
=A0 /usr/lib/gconv/IBM1162.so<br>=C2=A0 /usr/lib/gconv/ISO646.so<br>=C2=A0 =
/usr/lib/gconv/ISO8859-13.so<br>=C2=A0 /usr/lib/gconv/VISCII.so<br>=C2=A0 /=
usr/lib/gconv/ISO8859-1.so<br>=C2=A0 /usr/lib/gconv/IBM932.so<br>=C2=A0 /us=
r/lib/gconv/SAMI-WS2.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-UK.so<br>=C2=A0 /us=
r/lib/gconv/IBM1364.so<br>=C2=A0 /usr/lib/gconv/EUC-JISX0213.so<br>=C2=A0 /=
usr/lib/gconv/IBM297.so<br>=C2=A0 /usr/lib/gconv/ISO8859-15.so<br>=C2=A0 /u=
sr/lib/gconv/IEC_P27-1.so<br>=C2=A0 /usr/lib/gconv/IBM277.so<br>=C2=A0 /usr=
/lib/gconv/IBM904.so<br>=C2=A0 /usr/lib/gconv/EUC-JP-MS.so<br>=C2=A0 /usr/l=
ib/gconv/CP1251.so<br>=C2=A0 /usr/lib/gconv/ISO8859-9E.so<br>=C2=A0 /usr/li=
b/gconv/IBM1149.so<br>=C2=A0 /usr/lib/gconv/IBM902.so<br>=C2=A0 /usr/lib/gc=
onv/EBCDIC-US.so<br>=C2=A0 /usr/lib/gconv/ISO8859-9.so<br>=C2=A0 /usr/lib/g=
conv/IBM9066.so<br>=C2=A0 /usr/lib/gconv/IBM037.so<br>=C2=A0 /usr/lib/gconv=
/CP1255.so<br>=C2=A0 /usr/lib/gconv/IBM851.so<br>=C2=A0 /usr/lib/gconv/UNIC=
ODE.so<br>=C2=A0 /usr/lib/gconv/IBM860.so<br>=C2=A0 /usr/lib/gconv/RK1048.s=
o<br>=C2=A0 /usr/lib/gconv/IBM861.so<br>=C2=A0 /usr/lib/gconv/ISO_5427-EXT.=
so<br>=C2=A0 /usr/lib/gconv/EUC-TW.so<br>=C2=A0 /usr/lib/gconv/MAC-CENTRALE=
UROPE.so<br>=C2=A0 /usr/lib/gconv/ISO_11548-1.so<br>=C2=A0 /usr/lib/gconv/I=
SO-2022-CN-EXT.so<br>=C2=A0 /usr/lib/gconv/IBM874.so<br>=C2=A0 /usr/lib/gco=
nv/ISO-2022-JP.so<br>=C2=A0 /usr/lib/gconv/ISO_5427.so<br>=C2=A0 /usr/lib/g=
conv/ISO_6937-2.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-CA-FR.so<br>=C2=A0 /usr/=
lib/gconv/GEORGIAN-PS.so<br>=C2=A0 /usr/lib/gconv/HP-THAI8.so<br>=C2=A0 /us=
r/lib/gconv/IBM852.so<br>=C2=A0 /usr/lib/gconv/ISO8859-3.so<br>=C2=A0 /usr/=
lib/gconv/libKSC.so<br>=C2=A0 /usr/lib/gconv/HP-ROMAN9.so<br>=C2=A0 /usr/li=
b/gconv/IBM857.so<br>=C2=A0 /usr/lib/gconv/IBM420.so<br>=C2=A0 /usr/lib/gco=
nv/IBM12712.so<br>=C2=A0 /usr/lib/gconv/IBM273.so<br>=C2=A0 /usr/lib/gconv/=
IBM1142.so<br>=C2=A0 /usr/lib/gconv/MAC-IS.so<br>=C2=A0 /usr/lib/gconv/IBM1=
157.so<br>=C2=A0 /usr/lib/gconv/ISIRI-3342.so<br>=C2=A0 /usr/lib/gconv/IBM1=
144.so<br>=C2=A0 /usr/lib/gconv/IBM1147.so<br>=C2=A0 /usr/lib/gconv/IBM285.=
so<br>=C2=A0 /usr/lib/gconv/IBM866.so<br>=C2=A0 /usr/lib/gconv/IBM880.so<br=
>=C2=A0 /usr/lib/gconv/IBM4909.so<br>=C2=A0 /usr/lib/gconv/libCNS.so<br>=C2=
=A0 /usr/lib/gconv/CP1253.so<br>=C2=A0 /usr/lib/gconv/ISO8859-8.so<br>=C2=
=A0 /usr/lib/gconv/IBM1141.so<br>=C2=A0 /usr/lib/gconv/INIS-8.so<br>=C2=A0 =
/usr/lib/gconv/ECMA-CYRILLIC.so<br>=C2=A0 /usr/lib/gconv/GBK.so<br>=C2=A0 /=
usr/lib/gconv/EBCDIC-AT-DE.so<br>=C2=A0 /usr/lib/gconv/IBM1167.so<br>=C2=A0=
 /usr/lib/gconv/<a href=3D"http://T.61.so">T.61.so</a><br>=C2=A0 /usr/lib/g=
conv/IBM280.so<br>=C2=A0 /usr/lib/gconv/NATS-SEFI.so<br>=C2=A0 /usr/lib/gco=
nv/IBM918.so<br>=C2=A0 /usr/lib/gconv/ISO-2022-CN.so<br>=C2=A0 /usr/lib/gco=
nv/GB18030.so<br>=C2=A0 /usr/lib/gconv/IBM943.so<br>=C2=A0 /usr/lib/gconv/A=
SMO_449.so<br>=C2=A0 /usr/lib/gconv/GOST_19768-74.so<br>=C2=A0 /usr/lib/gco=
nv/IBM870.so<br>=C2=A0 /usr/lib/gconv/IBM868.so<br>=C2=A0 /usr/lib/gconv/IN=
IS.so<br>=C2=A0 /usr/lib/gconv/IBM1145.so<br>=C2=A0 /usr/lib/gconv/CP1258.s=
o<br>=C2=A0 /usr/lib/gconv/ISO8859-7.so<br>=C2=A0 /usr/lib/gconv/IBM4517.so=
<br>=C2=A0 /usr/lib/gconv/CP770.so<br>=C2=A0 /usr/lib/gconv/IBM875.so<br>=
=C2=A0 /usr/lib/gconv/ISO_5428.so<br>=C2=A0 /usr/lib/gconv/IBM866NAV.so<br>=
=C2=A0 /usr/lib/gconv/ISO-2022-JP-3.so<br>=C2=A0 /usr/lib/gconv/HP-ROMAN8.s=
o<br>=C2=A0 /usr/lib/gconv/IBM1143.so<br>=C2=A0 /usr/lib/gconv/IBM937.so<br=
>=C2=A0 /usr/lib/gconv/KOI8-RU.so<br>=C2=A0 /usr/lib/gconv/IBM922.so<br>=C2=
=A0 /usr/lib/gconv/NATS-DANO.so<br>=C2=A0 /usr/lib/gconv/IBM1004.so<br>=C2=
=A0 /usr/lib/gconv/IBM905.so<br>=C2=A0 /usr/lib/gconv/CP773.so<br>=C2=A0 /u=
sr/lib/gconv/GREEK-CCITT.so<br>=C2=A0 /usr/lib/gconv/KOI8-T.so<br>=C2=A0 /u=
sr/lib/gconv/ISO-2022-KR.so<br>=C2=A0 /usr/lib/gconv/UHC.so<br>=C2=A0 /usr/=
lib/gconv/MAC-UK.so<br>=C2=A0 /usr/lib/gconv/libGB.so<br>=C2=A0 /usr/lib/gc=
onv/ISO8859-6.so<br>=C2=A0 /usr/lib/gconv/IBM274.so<br>=C2=A0 /usr/lib/gcon=
v/GBBIG5.so<br>=C2=A0 /usr/lib/gconv/IBM891.so<br>=C2=A0 /usr/lib/gconv/IBM=
939.so<br>=C2=A0 /usr/lib/gconv/IBM1130.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-=
IT.so<br>=C2=A0 /usr/lib/gconv/KOI8-U.so<br>=C2=A0 /usr/lib/gconv/IBM278.so=
<br>=C2=A0 /usr/lib/gconv/ISO_6937.so<br>=C2=A0 /usr/lib/gconv/IBM437.so<br=
>=C2=A0 /usr/lib/gconv/IBM1026.so<br>=C2=A0 /usr/lib/gconv/UTF-32.so<br>=C2=
=A0 /usr/lib/gconv/CP1256.so<br>=C2=A0 /usr/lib/gconv/EBCDIC-ES.so<br>=C2=
=A0 /usr/lib/gconv/IBM933.so<br>=C2=A0 /usr/lib/gconv/ISO8859-11.so<br>=C2=
=A0 /usr/lib/gconv/IBM935.so<br>=C2=A0 /usr/lib/gconv/IBM1124.so<br>=C2=A0 =
/usr/lib/gconv/LATIN-GREEK-1.so<br>=C2=A0 /usr/lib/gconv/CSN_369103.so<br>=
=C2=A0 /usr/lib/gconv/BIG5.so<br>=C2=A0 /usr/lib/gconv/IBM1137.so<br>=C2=A0=
 /usr/lib/gconv/EUC-JP.so<br>=C2=A0 /usr/lib/gconv/CWI.so<br>=C2=A0 /usr/li=
b/gconv/IBM1160.so<br>=C2=A0 /usr/lib/gconv/IBM864.so<br>=C2=A0 /usr/lib/gc=
onv/CP1250.so<br>=C2=A0 /usr/lib/gconv/libJIS.so<br>=C2=A0 /usr/lib/gconv/I=
BM1166.so<br>=C2=A0 /usr/lib/gconv/IBM1164.so<br>=C2=A0 /usr/lib/gconv/<a h=
ref=3D"http://ANSI_X3.110.so">ANSI_X3.110.so</a><br>=C2=A0 /usr/lib/gconv/I=
BM4971.so<br>=C2=A0 /usr/lib/gconv/GREEK7.so<br>=C2=A0 /usr/lib/gconv/SHIFT=
_JISX0213.so<br>=C2=A0 /usr/lib/gconv/libISOIR165.so<br>=C2=A0 /usr/lib/gco=
nv/EBCDIC-DK-NO.so<br>=C2=A0 /usr/lib/gconv/IBM1371.so<br>=C2=A0 /usr/lib/g=
conv/gconv-modules<br>=C2=A0 /usr/lib/gconv/ISO8859-14.so<br>=C2=A0 /usr/li=
b/gconv/GBGBK.so<br>=C2=A0 /usr/lib/gconv/IBM855.so<br>=C2=A0 /usr/lib/gcon=
v/IBM1154.so<br>=C2=A0 /usr/lib/gconv/INIS-CYRILLIC.so<br>=C2=A0 /usr/lib/g=
conv/IBM856.so<br>=C2=A0 /usr/lib/gconv/ISO8859-16.so<br>=C2=A0 /usr/lib/gc=
onv/SJIS.so<br>=C2=A0 /usr/lib/gconv/CP774.so<br>=C2=A0 /usr/lib/gconv/GREE=
K7-OLD.so<br>=C2=A0 /usr/lib/gconv/IBM863.so<br>=C2=A0 /usr/lib/gconv/IBM10=
08_420.so<br>=C2=A0 /usr/lib/gconv/IBM1161.so<br>=C2=A0 /usr/lib/gconv/IBM1=
047.so<br>=C2=A0 /usr/lib/gconv/libJISX0213.so<br>=C2=A0 /usr/lib/gconv/MIK=
.so<br>=C2=A0 /usr/lib/gconv/JOHAB.so<br>=C2=A0 /usr/lib/gconv/IBM1390.so<b=
r>=C2=A0 /usr/lib/gconv/IBM1399.so<br>=C2=A0 /usr/lib/gconv/CP771.so<br>=C2=
=A0 /usr/lib/gconv/IBM1158.so<br>=C2=A0 /usr/lib/gconv/TSCII.so<br>=C2=A0 /=
usr/lib/gconv/ISO8859-4.so<br>=C2=A0 /usr/lib/gconv/IBM1148.so<br>=C2=A0 /u=
sr/lib/gconv/BRF.so<br>=C2=A0 /usr/lib/gconv/IBM4899.so<br>=C2=A0 /usr/lib/=
gconv/HP-GREEK8.so<br>=C2=A0 /usr/share/i18n<br>=C2=A0 /usr/share/i18n/char=
maps<br>=C2=A0 /usr/share/i18n/locales<br>=C2=A0 /usr/share/i18n/charmaps/J=
US_I.B1.003-MAC.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM1160.gz<br>=C2=A0 =
/usr/share/i18n/charmaps/CP1253.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM87=
0.gz<br>=C2=A0 /usr/share/i18n/charmaps/WINDOWS-31J.gz<br>=C2=A0 /usr/share=
/i18n/charmaps/ISO-IR-197.gz<br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6229-1=
984-B-ADD.gz<br>=C2=A0 /usr/share/i18n/charmaps/SEN_850200_B.gz<br>=C2=A0 /=
usr/share/i18n/charmaps/IBM038.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM284=
.gz<br>=C2=A0 /usr/share/i18n/charmaps/ANSI_X3.110-1983.gz<br>=C2=A0 /usr/s=
hare/i18n/charmaps/NF_Z_62-010_1973.gz<br>=C2=A0 /usr/share/i18n/charmaps/A=
RMSCII-8.gz<br>=C2=A0 /usr/share/i18n/charmaps/BIG5-HKSCS.gz<br>=C2=A0 /usr=
/share/i18n/charmaps/IBM1026.gz<br>=C2=A0 /usr/share/i18n/charmaps/PT.gz<br=
>=C2=A0 /usr/share/i18n/charmaps/IBM903.gz<br>=C2=A0 /usr/share/i18n/charma=
ps/MAC-IS.gz<br>=C2=A0 /usr/share/i18n/charmaps/INIS-8.gz<br>=C2=A0 /usr/sh=
are/i18n/charmaps/JIS_X0201.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-=
7.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM281.gz<br>=C2=A0 /usr/share/i18n=
/charmaps/BS_VIEWDATA.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM1162.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/ISO_5427.gz<br>=C2=A0 /usr/share/i18n/charm=
aps/EBCDIC-UK.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-ES.gz<br>=C2=A0 =
/usr/share/i18n/charmaps/EBCDIC-DK-NO-A.gz<br>=C2=A0 /usr/share/i18n/charma=
ps/NS_4551-2.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-8.gz<br>=C2=A0 =
/usr/share/i18n/charmaps/IBM1133.gz<br>=C2=A0 /usr/share/i18n/charmaps/KOI8=
-T.gz<br>=C2=A0 /usr/share/i18n/charmaps/HP-ROMAN8.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/MAC-UK.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM866NAV.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/ISO-8859-6.gz<br>=C2=A0 /usr/share/i18n/cha=
rmaps/CP773.gz<br>=C2=A0 /usr/share/i18n/charmaps/MSZ_7795.3.gz<br>=C2=A0 /=
usr/share/i18n/charmaps/EBCDIC-ES-S.gz<br>=C2=A0 /usr/share/i18n/charmaps/I=
BM277.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM868.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/ISO_10367-BOX.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-=
13.gz<br>=C2=A0 /usr/share/i18n/charmaps/INIS.gz<br>=C2=A0 /usr/share/i18n/=
charmaps/IBM273.gz<br>=C2=A0 /usr/share/i18n/charmaps/NATS-DANO-ADD.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/NATS-DANO.gz<br>=C2=A0 /usr/share/i18n/char=
maps/EUC-JP-MS.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-3.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/JIS_C6229-1984-A.gz<br>=C2=A0 /usr/share/i18n/=
charmaps/IEC_P27-1.gz<br>=C2=A0 /usr/share/i18n/charmaps/BRF.gz<br>=C2=A0 /=
usr/share/i18n/charmaps/IBM424.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM864=
.gz<br>=C2=A0 /usr/share/i18n/charmaps/SEN_850200_C.gz<br>=C2=A0 /usr/share=
/i18n/charmaps/ISO_8859-SUPP.gz<br>=C2=A0 /usr/share/i18n/charmaps/EUC-TW.g=
z<br>=C2=A0 /usr/share/i18n/charmaps/ISO_646.BASIC.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/KSC5636.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM290.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/ISO-8859-2.gz<br>=C2=A0 /usr/share/i18n/cha=
rmaps/EBCDIC-IS-FRISS.gz<br>=C2=A0 /usr/share/i18n/charmaps/UTF-8.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/EUC-JISX0213.gz<br>=C2=A0 /usr/share/i18n/char=
maps/SHIFT_JIS.gz<br>=C2=A0 /usr/share/i18n/charmaps/NC_NC00-10.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/IBM500.gz<br>=C2=A0 /usr/share/i18n/charmaps/C=
SA_Z243.4-1985-GR.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM874.gz<br>=C2=A0=
 /usr/share/i18n/charmaps/KOI8-RU.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM=
037.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-5.gz<br>=C2=A0 /usr/shar=
e/i18n/charmaps/IBM865.gz<br>=C2=A0 /usr/share/i18n/charmaps/T.61-7BIT.gz<b=
r>=C2=A0 /usr/share/i18n/charmaps/ISO_5427-EXT.gz<br>=C2=A0 /usr/share/i18n=
/charmaps/IBM1004.gz<br>=C2=A0 /usr/share/i18n/charmaps/T.101-G2.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/CSA_Z243.4-1985-2.gz<br>=C2=A0 /usr/share/i18n=
/charmaps/RK1048.gz<br>=C2=A0 /usr/share/i18n/charmaps/EUC-KR.gz<br>=C2=A0 =
/usr/share/i18n/charmaps/IBM1161.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM1=
164.gz<br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6229-1984-HAND.gz<br>=C2=A0 =
/usr/share/i18n/charmaps/HP-THAI8.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM=
905.gz<br>=C2=A0 /usr/share/i18n/charmaps/DS_2089.gz<br>=C2=A0 /usr/share/i=
18n/charmaps/PT154.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP1257.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/TSCII.gz<br>=C2=A0 /usr/share/i18n/charmaps/IB=
M866.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-PT.gz<br>=C2=A0 /usr/shar=
e/i18n/charmaps/IBM860.gz<br>=C2=A0 /usr/share/i18n/charmaps/NF_Z_62-010.gz=
<br>=C2=A0 /usr/share/i18n/charmaps/SAMI.gz<br>=C2=A0 /usr/share/i18n/charm=
aps/IBM297.gz<br>=C2=A0 /usr/share/i18n/charmaps/MAC-CENTRALEUROPE.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/CP1254.gz<br>=C2=A0 /usr/share/i18n/charmap=
s/CP774.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP772.gz<br>=C2=A0 /usr/share=
/i18n/charmaps/CP1256.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-1.gz<b=
r>=C2=A0 /usr/share/i18n/charmaps/ES2.gz<br>=C2=A0 /usr/share/i18n/charmaps=
/BIG5.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP1255.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/ISO_8859-1,GL.gz<br>=C2=A0 /usr/share/i18n/charmaps/SHIFT_JIS=
X0213.gz<br>=C2=A0 /usr/share/i18n/charmaps/LATIN-GREEK-1.gz<br>=C2=A0 /usr=
/share/i18n/charmaps/ANSI_X3.4-1968.gz<br>=C2=A0 /usr/share/i18n/charmaps/I=
BM862.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM857.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/ISO-8859-16.gz<br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6229-1=
984-KANA.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-14.gz<br>=C2=A0 /us=
r/share/i18n/charmaps/HP-ROMAN9.gz<br>=C2=A0 /usr/share/i18n/charmaps/CWI.g=
z<br>=C2=A0 /usr/share/i18n/charmaps/ISO_2033-1983.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/IBM256.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO_646.IRV.gz<b=
r>=C2=A0 /usr/share/i18n/charmaps/IBM875.gz<br>=C2=A0 /usr/share/i18n/charm=
aps/IBM1132.gz<br>=C2=A0 /usr/share/i18n/charmaps/VISCII.gz<br>=C2=A0 /usr/=
share/i18n/charmaps/IBM852.gz<br>=C2=A0 /usr/share/i18n/charmaps/GREEK-CCIT=
T.gz<br>=C2=A0 /usr/share/i18n/charmaps/DIN_66003.gz<br>=C2=A0 /usr/share/i=
18n/charmaps/HP-TURKISH8.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM856.gz<br=
>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-FI-SE.gz<br>=C2=A0 /usr/share/i18n/=
charmaps/ISO_6937-2-ADD.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM423.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/CSN_369103.gz<br>=C2=A0 /usr/share/i18n/cha=
rmaps/EBCDIC-AT-DE-A.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-IR-90.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/IBM922.gz<br>=C2=A0 /usr/share/i18n/charmap=
s/IBM1124.gz<br>=C2=A0 /usr/share/i18n/charmaps/GREEK7-OLD.gz<br>=C2=A0 /us=
r/share/i18n/charmaps/IBM1163.gz<br>=C2=A0 /usr/share/i18n/charmaps/BS_4730=
.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP10007.gz<br>=C2=A0 /usr/share/i18n=
/charmaps/INVARIANT.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-FI-SE-A.gz=
<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-9.gz<br>=C2=A0 /usr/share/i18n=
/charmaps/IBM437.gz<br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6229-1984-B.gz<=
br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6220-1969-JP.gz<br>=C2=A0 /usr/shar=
e/i18n/charmaps/CP1258.gz<br>=C2=A0 /usr/share/i18n/charmaps/VIDEOTEX-SUPPL=
.gz<br>=C2=A0 /usr/share/i18n/charmaps/HP-GREEK8.gz<br>=C2=A0 /usr/share/i1=
8n/charmaps/EBCDIC-FR.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-4.gz<b=
r>=C2=A0 /usr/share/i18n/charmaps/CP737.gz<br>=C2=A0 /usr/share/i18n/charma=
ps/GEORGIAN-PS.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-CA-FR.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/NEXTSTEP.gz<br>=C2=A0 /usr/share/i18n/charmaps=
/MAC-SAMI.gz<br>=C2=A0 /usr/share/i18n/charmaps/GB2312.gz<br>=C2=A0 /usr/sh=
are/i18n/charmaps/IBM863.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM850.gz<br=
>=C2=A0 /usr/share/i18n/charmaps/MACINTOSH.gz<br>=C2=A0 /usr/share/i18n/cha=
rmaps/IBM891.gz<br>=C2=A0 /usr/share/i18n/charmaps/DEC-MCS.gz<br>=C2=A0 /us=
r/share/i18n/charmaps/NS_4551-1.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8=
859-15.gz<br>=C2=A0 /usr/share/i18n/charmaps/LATIN-GREEK.gz<br>=C2=A0 /usr/=
share/i18n/charmaps/GB_1988-80.gz<br>=C2=A0 /usr/share/i18n/charmaps/MAC-CY=
RILLIC.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-ES-A.gz<br>=C2=A0 /usr/=
share/i18n/charmaps/EUC-JP.gz<br>=C2=A0 /usr/share/i18n/charmaps/JUS_I.B1.0=
03-SERB.gz<br>=C2=A0 /usr/share/i18n/charmaps/TIS-620.gz<br>=C2=A0 /usr/sha=
re/i18n/charmaps/CSA_Z243.4-1985-1.gz<br>=C2=A0 /usr/share/i18n/charmaps/IB=
M918.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-8859-9E.gz<br>=C2=A0 /usr/sh=
are/i18n/charmaps/ISIRI-3342.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM861.g=
z<br>=C2=A0 /usr/share/i18n/charmaps/KOI8-U.gz<br>=C2=A0 /usr/share/i18n/ch=
armaps/GOST_19768-74.gz<br>=C2=A0 /usr/share/i18n/charmaps/SAMI-WS2.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/ISO-8859-10.gz<br>=C2=A0 /usr/share/i18n/ch=
armaps/ISO_6937.gz<br>=C2=A0 /usr/share/i18n/charmaps/PT2.gz<br>=C2=A0 /usr=
/share/i18n/charmaps/CP1125.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO-IR-20=
9.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO_11548-1.gz<br>=C2=A0 /usr/share=
/i18n/charmaps/CP1250.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM1047.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/INIS-CYRILLIC.gz<br>=C2=A0 /usr/share/i18n/=
charmaps/IBM274.gz<br>=C2=A0 /usr/share/i18n/charmaps/T.61-8BIT.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/IBM285.gz<br>=C2=A0 /usr/share/i18n/charmaps/N=
ATS-SEFI-ADD.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM278.gz<br>=C2=A0 /usr=
/share/i18n/charmaps/JUS_I.B1.002.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP1=
252.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-DK-NO.gz<br>=C2=A0 /usr/sh=
are/i18n/charmaps/KOI8-R.gz<br>=C2=A0 /usr/share/i18n/charmaps/CP949.gz<br>=
=C2=A0 /usr/share/i18n/charmaps/ISO_10646.gz<br>=C2=A0 /usr/share/i18n/char=
maps/CP770.gz<br>=C2=A0 /usr/share/i18n/charmaps/ISO_5428.gz<br>=C2=A0 /usr=
/share/i18n/charmaps/IBM420.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-AT=
-DE.gz<br>=C2=A0 /usr/share/i18n/charmaps/ASMO_449.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/CP771.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM1129.gz<br>=C2=
=A0 /usr/share/i18n/charmaps/GBK.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM9=
04.gz<br>=C2=A0 /usr/share/i18n/charmaps/TCVN5712-1.gz<br>=C2=A0 /usr/share=
/i18n/charmaps/ISO_6937-2-25.gz<br>=C2=A0 /usr/share/i18n/charmaps/KOI-8.gz=
<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-IT.gz<br>=C2=A0 /usr/share/i18n/=
charmaps/JIS_C6229-1984-HAND-ADD.gz<br>=C2=A0 /usr/share/i18n/charmaps/NATS=
-SEFI.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM851.gz<br>=C2=A0 /usr/share/=
i18n/charmaps/MIK.gz<br>=C2=A0 /usr/share/i18n/charmaps/ECMA-CYRILLIC.gz<br=
>=C2=A0 /usr/share/i18n/charmaps/IBM869.gz<br>=C2=A0 /usr/share/i18n/charma=
ps/GREEK7.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM280.gz<br>=C2=A0 /usr/sh=
are/i18n/charmaps/JOHAB.gz<br>=C2=A0 /usr/share/i18n/charmaps/EBCDIC-US.gz<=
br>=C2=A0 /usr/share/i18n/charmaps/ES.gz<br>=C2=A0 /usr/share/i18n/charmaps=
/ISO-8859-11.gz<br>=C2=A0 /usr/share/i18n/charmaps/GB18030.gz<br>=C2=A0 /us=
r/share/i18n/charmaps/IBM871.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM880.g=
z<br>=C2=A0 /usr/share/i18n/charmaps/CP775.gz<br>=C2=A0 /usr/share/i18n/cha=
rmaps/IT.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM855.gz<br>=C2=A0 /usr/sha=
re/i18n/charmaps/GEORGIAN-ACADEMY.gz<br>=C2=A0 /usr/share/i18n/charmaps/IBM=
275.gz<br>=C2=A0 /usr/share/i18n/charmaps/JIS_C6220-1969-RO.gz<br>=C2=A0 /u=
sr/share/i18n/charmaps/CP1251.gz<br>=C2=A0 /usr/share/i18n/locales/es_ES@eu=
ro<br>=C2=A0 /usr/share/i18n/locales/zh_HK<br>=C2=A0 /usr/share/i18n/locale=
s/de_DE<br>=C2=A0 /usr/share/i18n/locales/ar_OM<br>=C2=A0 /usr/share/i18n/l=
ocales/nds_DE<br>=C2=A0 /usr/share/i18n/locales/yo_NG<br>=C2=A0 /usr/share/=
i18n/locales/fy_DE<br>=C2=A0 /usr/share/i18n/locales/th_TH<br>=C2=A0 /usr/s=
hare/i18n/locales/fo_FO<br>=C2=A0 /usr/share/i18n/locales/pa_IN<br>=C2=A0 /=
usr/share/i18n/locales/zh_TW<br>=C2=A0 /usr/share/i18n/locales/ar_BH<br>=C2=
=A0 /usr/share/i18n/locales/lt_LT<br>=C2=A0 /usr/share/i18n/locales/ff_SN<b=
r>=C2=A0 /usr/share/i18n/locales/ur_PK<br>=C2=A0 /usr/share/i18n/locales/he=
_IL<br>=C2=A0 /usr/share/i18n/locales/sr_RS<br>=C2=A0 /usr/share/i18n/local=
es/br_FR@euro<br>=C2=A0 /usr/share/i18n/locales/es_PE<br>=C2=A0 /usr/share/=
i18n/locales/en_DK<br>=C2=A0 /usr/share/i18n/locales/nr_ZA<br>=C2=A0 /usr/s=
hare/i18n/locales/it_IT<br>=C2=A0 /usr/share/i18n/locales/ar_YE<br>=C2=A0 /=
usr/share/i18n/locales/bem_ZM<br>=C2=A0 /usr/share/i18n/locales/aa_ER@saaho=
<br>=C2=A0 /usr/share/i18n/locales/iso14651_t1<br>=C2=A0 /usr/share/i18n/lo=
cales/es_ES<br>=C2=A0 /usr/share/i18n/locales/es_MX<br>=C2=A0 /usr/share/i1=
8n/locales/en_BW<br>=C2=A0 /usr/share/i18n/locales/sv_FI<br>=C2=A0 /usr/sha=
re/i18n/locales/crh_UA<br>=C2=A0 /usr/share/i18n/locales/sgs_LT<br>=C2=A0 /=
usr/share/i18n/locales/el_GR<br>=C2=A0 /usr/share/i18n/locales/en_IE<br>=C2=
=A0 /usr/share/i18n/locales/br_FR<br>=C2=A0 /usr/share/i18n/locales/ar_LY<b=
r>=C2=A0 /usr/share/i18n/locales/en_SG<br>=C2=A0 /usr/share/i18n/locales/tr=
anslit_cjk_variants<br>=C2=A0 /usr/share/i18n/locales/en_AU<br>=C2=A0 /usr/=
share/i18n/locales/ha_NG<br>=C2=A0 /usr/share/i18n/locales/nl_AW<br>=C2=A0 =
/usr/share/i18n/locales/de_BE@euro<br>=C2=A0 /usr/share/i18n/locales/uz_UZ<=
br>=C2=A0 /usr/share/i18n/locales/en_ZA<br>=C2=A0 /usr/share/i18n/locales/t=
ig_ER<br>=C2=A0 /usr/share/i18n/locales/fi_FI<br>=C2=A0 /usr/share/i18n/loc=
ales/ml_IN<br>=C2=A0 /usr/share/i18n/locales/nan_TW<br>=C2=A0 /usr/share/i1=
8n/locales/nds_NL<br>=C2=A0 /usr/share/i18n/locales/ps_AF<br>=C2=A0 /usr/sh=
are/i18n/locales/sa_IN<br>=C2=A0 /usr/share/i18n/locales/ber_MA<br>=C2=A0 /=
usr/share/i18n/locales/ht_HT<br>=C2=A0 /usr/share/i18n/locales/en_ZM<br>=C2=
=A0 /usr/share/i18n/locales/gu_IN<br>=C2=A0 /usr/share/i18n/locales/ug_CN<b=
r>=C2=A0 /usr/share/i18n/locales/fi_FI@euro<br>=C2=A0 /usr/share/i18n/local=
es/translit_small<br>=C2=A0 /usr/share/i18n/locales/aa_ET<br>=C2=A0 /usr/sh=
are/i18n/locales/sr_RS@latin<br>=C2=A0 /usr/share/i18n/locales/en_PH<br>=C2=
=A0 /usr/share/i18n/locales/ca_ES@euro<br>=C2=A0 /usr/share/i18n/locales/en=
_AG<br>=C2=A0 /usr/share/i18n/locales/it_CH<br>=C2=A0 /usr/share/i18n/local=
es/sv_FI@euro<br>=C2=A0 /usr/share/i18n/locales/fy_NL<br>=C2=A0 /usr/share/=
i18n/locales/nl_BE<br>=C2=A0 /usr/share/i18n/locales/doi_IN<br>=C2=A0 /usr/=
share/i18n/locales/gez_ER@abegede<br>=C2=A0 /usr/share/i18n/locales/shs_CA<=
br>=C2=A0 /usr/share/i18n/locales/tk_TM<br>=C2=A0 /usr/share/i18n/locales/s=
t_ZA<br>=C2=A0 /usr/share/i18n/locales/be_BY@latin<br>=C2=A0 /usr/share/i18=
n/locales/szl_PL<br>=C2=A0 /usr/share/i18n/locales/sw_TZ<br>=C2=A0 /usr/sha=
re/i18n/locales/lb_LU<br>=C2=A0 /usr/share/i18n/locales/fr_FR<br>=C2=A0 /us=
r/share/i18n/locales/ar_MA<br>=C2=A0 /usr/share/i18n/locales/cy_GB<br>=C2=
=A0 /usr/share/i18n/locales/es_VE<br>=C2=A0 /usr/share/i18n/locales/km_KH<b=
r>=C2=A0 /usr/share/i18n/locales/mn_MN<br>=C2=A0 /usr/share/i18n/locales/sa=
t_IN<br>=C2=A0 /usr/share/i18n/locales/sw_KE<br>=C2=A0 /usr/share/i18n/loca=
les/nl_NL<br>=C2=A0 /usr/share/i18n/locales/lij_IT<br>=C2=A0 /usr/share/i18=
n/locales/ar_IN<br>=C2=A0 /usr/share/i18n/locales/ar_DZ<br>=C2=A0 /usr/shar=
e/i18n/locales/en_NG<br>=C2=A0 /usr/share/i18n/locales/vi_VN<br>=C2=A0 /usr=
/share/i18n/locales/hr_HR<br>=C2=A0 /usr/share/i18n/locales/da_DK<br>=C2=A0=
 /usr/share/i18n/locales/es_GT<br>=C2=A0 /usr/share/i18n/locales/chr_US<br>=
=C2=A0 /usr/share/i18n/locales/lo_LA<br>=C2=A0 /usr/share/i18n/locales/pa_P=
K<br>=C2=A0 /usr/share/i18n/locales/ast_ES<br>=C2=A0 /usr/share/i18n/locale=
s/tn_ZA<br>=C2=A0 /usr/share/i18n/locales/rw_RW<br>=C2=A0 /usr/share/i18n/l=
ocales/dv_MV<br>=C2=A0 /usr/share/i18n/locales/bs_BA<br>=C2=A0 /usr/share/i=
18n/locales/ka_GE<br>=C2=A0 /usr/share/i18n/locales/en_GB<br>=C2=A0 /usr/sh=
are/i18n/locales/nl_NL@euro<br>=C2=A0 /usr/share/i18n/locales/ca_FR<br>=C2=
=A0 /usr/share/i18n/locales/ce_RU<br>=C2=A0 /usr/share/i18n/locales/de_IT<b=
r>=C2=A0 /usr/share/i18n/locales/ti_ET<br>=C2=A0 /usr/share/i18n/locales/lz=
h_TW<br>=C2=A0 /usr/share/i18n/locales/bhb_IN<br>=C2=A0 /usr/share/i18n/loc=
ales/ig_NG<br>=C2=A0 /usr/share/i18n/locales/de_LU@euro<br>=C2=A0 /usr/shar=
e/i18n/locales/en_IL<br>=C2=A0 /usr/share/i18n/locales/gl_ES<br>=C2=A0 /usr=
/share/i18n/locales/ln_CD<br>=C2=A0 /usr/share/i18n/locales/sr_ME<br>=C2=A0=
 /usr/share/i18n/locales/gl_ES@euro<br>=C2=A0 /usr/share/i18n/locales/bn_BD=
<br>=C2=A0 /usr/share/i18n/locales/translit_circle<br>=C2=A0 /usr/share/i18=
n/locales/aa_DJ<br>=C2=A0 /usr/share/i18n/locales/ru_UA<br>=C2=A0 /usr/shar=
e/i18n/locales/mk_MK<br>=C2=A0 /usr/share/i18n/locales/iso14651_t1_common<b=
r>=C2=A0 /usr/share/i18n/locales/tt_RU<br>=C2=A0 /usr/share/i18n/locales/ar=
_SS<br>=C2=A0 /usr/share/i18n/locales/pt_PT@euro<br>=C2=A0 /usr/share/i18n/=
locales/lv_LV<br>=C2=A0 /usr/share/i18n/locales/fr_CH<br>=C2=A0 /usr/share/=
i18n/locales/translit_font<br>=C2=A0 /usr/share/i18n/locales/es_UY<br>=C2=
=A0 /usr/share/i18n/locales/fr_LU<br>=C2=A0 /usr/share/i18n/locales/anp_IN<=
br>=C2=A0 /usr/share/i18n/locales/de_DE@euro<br>=C2=A0 /usr/share/i18n/loca=
les/nb_NO<br>=C2=A0 /usr/share/i18n/locales/pl_PL<br>=C2=A0 /usr/share/i18n=
/locales/ar_SY<br>=C2=A0 /usr/share/i18n/locales/ms_MY<br>=C2=A0 /usr/share=
/i18n/locales/sid_ET<br>=C2=A0 /usr/share/i18n/locales/bn_IN<br>=C2=A0 /usr=
/share/i18n/locales/es_CU<br>=C2=A0 /usr/share/i18n/locales/gd_GB<br>=C2=A0=
 /usr/share/i18n/locales/yue_HK<br>=C2=A0 /usr/share/i18n/locales/the_NP<br=
>=C2=A0 /usr/share/i18n/locales/hi_IN<br>=C2=A0 /usr/share/i18n/locales/hy_=
AM<br>=C2=A0 /usr/share/i18n/locales/ar_SD<br>=C2=A0 /usr/share/i18n/locale=
s/zh_CN<br>=C2=A0 /usr/share/i18n/locales/zh_SG<br>=C2=A0 /usr/share/i18n/l=
ocales/wo_SN<br>=C2=A0 /usr/share/i18n/locales/hne_IN<br>=C2=A0 /usr/share/=
i18n/locales/mi_NZ<br>=C2=A0 /usr/share/i18n/locales/ar_TN<br>=C2=A0 /usr/s=
hare/i18n/locales/es_DO<br>=C2=A0 /usr/share/i18n/locales/sd_IN@devanagari<=
br>=C2=A0 /usr/share/i18n/locales/uk_UA<br>=C2=A0 /usr/share/i18n/locales/u=
z_UZ@cyrillic<br>=C2=A0 /usr/share/i18n/locales/ar_LB<br>=C2=A0 /usr/share/=
i18n/locales/id_ID<br>=C2=A0 /usr/share/i18n/locales/ku_TR<br>=C2=A0 /usr/s=
hare/i18n/locales/gez_ER<br>=C2=A0 /usr/share/i18n/locales/en_HK<br>=C2=A0 =
/usr/share/i18n/locales/sq_AL<br>=C2=A0 /usr/share/i18n/locales/fr_CA<br>=
=C2=A0 /usr/share/i18n/locales/ve_ZA<br>=C2=A0 /usr/share/i18n/locales/pt_B=
R<br>=C2=A0 /usr/share/i18n/locales/ar_JO<br>=C2=A0 /usr/share/i18n/locales=
/so_KE<br>=C2=A0 /usr/share/i18n/locales/eo<br>=C2=A0 /usr/share/i18n/local=
es/ber_DZ<br>=C2=A0 /usr/share/i18n/locales/translit_compat<br>=C2=A0 /usr/=
share/i18n/locales/es_EC<br>=C2=A0 /usr/share/i18n/locales/om_KE<br>=C2=A0 =
/usr/share/i18n/locales/ko_KR<br>=C2=A0 /usr/share/i18n/locales/ar_AE<br>=
=C2=A0 /usr/share/i18n/locales/ar_EG<br>=C2=A0 /usr/share/i18n/locales/ro_R=
O<br>=C2=A0 /usr/share/i18n/locales/en_IE@euro<br>=C2=A0 /usr/share/i18n/lo=
cales/es_PR<br>=C2=A0 /usr/share/i18n/locales/xh_ZA<br>=C2=A0 /usr/share/i1=
8n/locales/translit_narrow<br>=C2=A0 /usr/share/i18n/locales/ar_KW<br>=C2=
=A0 /usr/share/i18n/locales/niu_NU<br>=C2=A0 /usr/share/i18n/locales/ks_IN@=
devanagari<br>=C2=A0 /usr/share/i18n/locales/nl_BE@euro<br>=C2=A0 /usr/shar=
e/i18n/locales/en_CA<br>=C2=A0 /usr/share/i18n/locales/kk_KZ<br>=C2=A0 /usr=
/share/i18n/locales/aa_ER<br>=C2=A0 /usr/share/i18n/locales/ta_LK<br>=C2=A0=
 /usr/share/i18n/locales/nn_NO<br>=C2=A0 /usr/share/i18n/locales/nhn_MX<br>=
=C2=A0 /usr/share/i18n/locales/de_AT<br>=C2=A0 /usr/share/i18n/locales/ur_I=
N<br>=C2=A0 /usr/share/i18n/locales/my_MM<br>=C2=A0 /usr/share/i18n/locales=
/niu_NZ<br>=C2=A0 /usr/share/i18n/locales/translit_combining<br>=C2=A0 /usr=
/share/i18n/locales/ar_QA<br>=C2=A0 /usr/share/i18n/locales/gez_ET@abegede<=
br>=C2=A0 /usr/share/i18n/locales/pt_PT<br>=C2=A0 /usr/share/i18n/locales/f=
r_LU@euro<br>=C2=A0 /usr/share/i18n/locales/es_AR<br>=C2=A0 /usr/share/i18n=
/locales/en_ZW<br>=C2=A0 /usr/share/i18n/locales/gez_ET<br>=C2=A0 /usr/shar=
e/i18n/locales/li_BE<br>=C2=A0 /usr/share/i18n/locales/so_DJ<br>=C2=A0 /usr=
/share/i18n/locales/ar_SA<br>=C2=A0 /usr/share/i18n/locales/cmn_TW<br>=C2=
=A0 /usr/share/i18n/locales/es_PY<br>=C2=A0 /usr/share/i18n/locales/el_GR@e=
uro<br>=C2=A0 /usr/share/i18n/locales/as_IN<br>=C2=A0 /usr/share/i18n/local=
es/es_PA<br>=C2=A0 /usr/share/i18n/locales/ss_ZA<br>=C2=A0 /usr/share/i18n/=
locales/es_CR<br>=C2=A0 /usr/share/i18n/locales/es_SV<br>=C2=A0 /usr/share/=
i18n/locales/wa_BE@euro<br>=C2=A0 /usr/share/i18n/locales/so_SO<br>=C2=A0 /=
usr/share/i18n/locales/fil_PH<br>=C2=A0 /usr/share/i18n/locales/ja_JP<br>=
=C2=A0 /usr/share/i18n/locales/fr_BE@euro<br>=C2=A0 /usr/share/i18n/locales=
/ts_ZA<br>=C2=A0 /usr/share/i18n/locales/tt_RU@iqtelif<br>=C2=A0 /usr/share=
/i18n/locales/ia_FR<br>=C2=A0 /usr/share/i18n/locales/ayc_PE<br>=C2=A0 /usr=
/share/i18n/locales/es_US<br>=C2=A0 /usr/share/i18n/locales/ti_ER<br>=C2=A0=
 /usr/share/i18n/locales/pap_AW<br>=C2=A0 /usr/share/i18n/locales/ca_AD<br>=
=C2=A0 /usr/share/i18n/locales/de_LI<br>=C2=A0 /usr/share/i18n/locales/hsb_=
DE<br>=C2=A0 /usr/share/i18n/locales/nso_ZA<br>=C2=A0 /usr/share/i18n/local=
es/mag_IN<br>=C2=A0 /usr/share/i18n/locales/zu_ZA<br>=C2=A0 /usr/share/i18n=
/locales/en_NZ<br>=C2=A0 /usr/share/i18n/locales/pap_CW<br>=C2=A0 /usr/shar=
e/i18n/locales/unm_US<br>=C2=A0 /usr/share/i18n/locales/gv_GB<br>=C2=A0 /us=
r/share/i18n/locales/kl_GL<br>=C2=A0 /usr/share/i18n/locales/si_LK<br>=C2=
=A0 /usr/share/i18n/locales/te_IN<br>=C2=A0 /usr/share/i18n/locales/wae_CH<=
br>=C2=A0 /usr/share/i18n/locales/tr_TR<br>=C2=A0 /usr/share/i18n/locales/b=
g_BG<br>=C2=A0 /usr/share/i18n/locales/es_HN<br>=C2=A0 /usr/share/i18n/loca=
les/om_ET<br>=C2=A0 /usr/share/i18n/locales/de_AT@euro<br>=C2=A0 /usr/share=
/i18n/locales/sq_MK<br>=C2=A0 /usr/share/i18n/locales/quz_PE<br>=C2=A0 /usr=
/share/i18n/locales/bho_IN<br>=C2=A0 /usr/share/i18n/locales/translit_wide<=
br>=C2=A0 /usr/share/i18n/locales/fa_IR<br>=C2=A0 /usr/share/i18n/locales/i=
u_CA<br>=C2=A0 /usr/share/i18n/locales/mt_MT<br>=C2=A0 /usr/share/i18n/loca=
les/translit_fraction<br>=C2=A0 /usr/share/i18n/locales/ak_GH<br>=C2=A0 /us=
r/share/i18n/locales/iso14651_t1_pinyin<br>=C2=A0 /usr/share/i18n/locales/i=
s_IS<br>=C2=A0 /usr/share/i18n/locales/so_ET<br>=C2=A0 /usr/share/i18n/loca=
les/oc_FR<br>=C2=A0 /usr/share/i18n/locales/mni_IN<br>=C2=A0 /usr/share/i18=
n/locales/bo_CN<br>=C2=A0 /usr/share/i18n/locales/be_BY<br>=C2=A0 /usr/shar=
e/i18n/locales/it_IT@euro<br>=C2=A0 /usr/share/i18n/locales/tr_CY<br>=C2=A0=
 /usr/share/i18n/locales/dz_BT<br>=C2=A0 /usr/share/i18n/locales/sv_SE<br>=
=C2=A0 /usr/share/i18n/locales/ks_IN<br>=C2=A0 /usr/share/i18n/locales/ne_N=
P<br>=C2=A0 /usr/share/i18n/locales/hak_TW<br>=C2=A0 /usr/share/i18n/locale=
s/am_ET<br>=C2=A0 /usr/share/i18n/locales/raj_IN<br>=C2=A0 /usr/share/i18n/=
locales/af_ZA<br>=C2=A0 /usr/share/i18n/locales/es_BO<br>=C2=A0 /usr/share/=
i18n/locales/mg_MG<br>=C2=A0 /usr/share/i18n/locales/csb_PL<br>=C2=A0 /usr/=
share/i18n/locales/eu_ES@euro<br>=C2=A0 /usr/share/i18n/locales/fr_BE<br>=
=C2=A0 /usr/share/i18n/locales/de_LU<br>=C2=A0 /usr/share/i18n/locales/ru_R=
U<br>=C2=A0 /usr/share/i18n/locales/bo_IN<br>=C2=A0 /usr/share/i18n/locales=
/es_CO<br>=C2=A0 /usr/share/i18n/locales/lg_UG<br>=C2=A0 /usr/share/i18n/lo=
cales/an_ES<br>=C2=A0 /usr/share/i18n/locales/wal_ET<br>=C2=A0 /usr/share/i=
18n/locales/li_NL<br>=C2=A0 /usr/share/i18n/locales/or_IN<br>=C2=A0 /usr/sh=
are/i18n/locales/eu_ES<br>=C2=A0 /usr/share/i18n/locales/ik_CA<br>=C2=A0 /u=
sr/share/i18n/locales/el_CY<br>=C2=A0 /usr/share/i18n/locales/de_CH<br>=C2=
=A0 /usr/share/i18n/locales/sk_SK<br>=C2=A0 /usr/share/i18n/locales/nan_TW@=
latin<br>=C2=A0 /usr/share/i18n/locales/byn_ER<br>=C2=A0 /usr/share/i18n/lo=
cales/en_US<br>=C2=A0 /usr/share/i18n/locales/ta_IN<br>=C2=A0 /usr/share/i1=
8n/locales/kok_IN<br>=C2=A0 /usr/share/i18n/locales/ca_ES<br>=C2=A0 /usr/sh=
are/i18n/locales/fur_IT<br>=C2=A0 /usr/share/i18n/locales/en_IN<br>=C2=A0 /=
usr/share/i18n/locales/es_NI<br>=C2=A0 /usr/share/i18n/locales/hu_HU<br>=C2=
=A0 /usr/share/i18n/locales/yi_US<br>=C2=A0 /usr/share/i18n/locales/es_CL<b=
r>=C2=A0 /usr/share/i18n/locales/tcy_IN<br>=C2=A0 /usr/share/i18n/locales/s=
c_IT<br>=C2=A0 /usr/share/i18n/locales/ca_IT<br>=C2=A0 /usr/share/i18n/loca=
les/et_EE<br>=C2=A0 /usr/share/i18n/locales/mr_IN<br>=C2=A0 /usr/share/i18n=
/locales/mai_IN<br>=C2=A0 /usr/share/i18n/locales/kn_IN<br>=C2=A0 /usr/shar=
e/i18n/locales/de_BE<br>=C2=A0 /usr/share/i18n/locales/cs_CZ<br>=C2=A0 /usr=
/share/i18n/locales/ga_IE<br>=C2=A0 /usr/share/i18n/locales/i18n<br>=C2=A0 =
/usr/share/i18n/locales/se_NO<br>=C2=A0 /usr/share/i18n/locales/sd_IN<br>=
=C2=A0 /usr/share/i18n/locales/sl_SI<br>=C2=A0 /usr/share/i18n/locales/mhr_=
RU<br>=C2=A0 /usr/share/i18n/locales/ga_IE@euro<br>=C2=A0 /usr/share/i18n/l=
ocales/wa_BE<br>=C2=A0 /usr/share/i18n/locales/ar_IQ<br>=C2=A0 /usr/share/i=
18n/locales/POSIX<br>=C2=A0 /usr/share/i18n/locales/tg_TJ<br>=C2=A0 /usr/sh=
are/i18n/locales/ky_KG<br>=C2=A0 /usr/share/i18n/locales/kw_GB<br>=C2=A0 /u=
sr/share/i18n/locales/translit_neutral<br>=C2=A0 /usr/share/i18n/locales/os=
_RU<br>=C2=A0 /usr/share/i18n/locales/cv_RU<br>=C2=A0 /usr/share/i18n/local=
es/translit_hangul<br>=C2=A0 /usr/share/i18n/locales/brx_IN<br>=C2=A0 /usr/=
share/i18n/locales/fr_FR@euro<br>=C2=A0 /usr/share/i18n/locales/az_AZ<br>=
=C2=A0 /usr/share/i18n/locales/translit_cjk_compat<br>=C2=A0 /usr/share/i18=
n/locales/tl_PH<br>Please set FILES such that these items are packaged. Alt=
ernatively if they are unneeded, avoid installing them or delete them withi=
n do_install.<br>glibc-locale: 820 installed and not shipped files. [instal=
led-vs-shipped]<br>ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors =
found, failing task.<br>ERROR: glibc-locale-2.24-r0 do_package: Function fa=
iled: do_package<br>ERROR: Logfile of failure stored in: /home/njking/yocto=
_morty/build_xen_qemu/tmp/work/core2-64-poky-linux/glibc-locale/2.24-r0/tem=
p/log.do_package.17564<br>ERROR: Task (/home/njking/yocto_morty/poky/meta/r=
ecipes-core/glibc/glibc-locale_2.24.bb:do_package) failed with exit code &#=
39;1&#39;<br><br><br></div>I have added following lines in my local.conf<br=
><br>EXTRA_IMAGE_FEATURES +=3D &quot;ssh-server-openssh&quot;<br>MACHINE ?=
=3D &quot;qemux86-64&quot;<br>DISTRO_FEATURES +=3D &quot;xen&quot;<br><br><=
/div>Somebody help me to get this issue solved<br clear=3D"all"><div><div><=
div><div><div><div><br></div><div>Thanks<br></div><div>-- <br><div class=3D=
"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:arial;font-=
size:small"><div><b>Nitish Jha</b></div><div><b><br></b></div></div></div><=
/div></div></div></div></div></div></div>
</div></div></div></div></div></div></div>

--001a113ac1bc06e3fe05484347d2--
