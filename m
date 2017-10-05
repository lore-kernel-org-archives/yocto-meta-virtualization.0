Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97794E00D7E; Thu,  5 Oct 2017 02:00:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.65 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3D56E00D6D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 02:00:30 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id g70so586055lfl.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uPsRV+FbvTrZxYHT06U/keSeQ0T03G3hMnrw3uR1AOY=;
	b=eUNrtMkFPNxnjz+6Hg/OEBWl+UUTyvB61k2y7+xc/OVGcu7A3yexVf1rdZJeaWiXmB
	xuYNLHFtBfoWKVdwEQrNPCtUXYyUga61Uj7irWlS/OSMeSN6OpMx4cCzMFPJ3opDlvBC
	/HvoyU5RfXeAsU82layhrTmWis+/PJtm/WlFNzck51eOm43T16behThE6FKjCK+igKeS
	vEHYxrczAbQXp14QlEIO4RG0f2X8UjNva33zQNr2O2q3CAgjQqHB9Ed3LNaksxfsrWMD
	4x9d5Q+IsBNTUpMMh+OCSG3fZ50RioBECkJVVYz//984OwpF+R0a2fo6rBa39s6qpy2g
	+RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uPsRV+FbvTrZxYHT06U/keSeQ0T03G3hMnrw3uR1AOY=;
	b=Gf75xZ9t6HM9mUxIBSdgyrOWDpHJPTig31dk95Ki+XDt2reNvX5TMXpsq+Swtx4qOa
	13XXjrpRQ8Vgt6TinhbHg3bi6Scm23xNLF2DmVpGbnN9WSdg9cs3Ew2TTQUWpDxy3Cnl
	6bPyDE1pXZFnqZOpxThkoi9la8cBQgoG6lZQX5UZ3qjUYnmeM072GQWytq5yA2O409zc
	VEjnoKwyCPHD8GRhAYpPGz9sTXm+sCoa7LE+l+DPXjvDuP2QYuX7XCg9MBH3ToaT6M9Z
	U9gUcrlkfGtyp6XOI0uw0kIrO4efhLnGZ6gH+UnRthevD/JMyk29KipKiEuuSfZ/Xfxz
	133Q==
X-Gm-Message-State: AHPjjUgSdIZYAiUo6iVFiUJS8no1fWBcmIGXINyjmcvQHrBCIfNdpDAF
	JwGN72Xz5VFR3Uzv2TPQJNWFz+g3
X-Google-Smtp-Source: AOwi7QAH6oeYn0d5ptxemFfAHoA6+2IxlliZNkjbR6ipzNCLssPVB7V5bbTpsMOVjuid+++ian2C4A==
X-Received: by 10.25.25.203 with SMTP id 194mr7644689lfz.258.1507194029222;
	Thu, 05 Oct 2017 02:00:29 -0700 (PDT)
Received: from duzy.lan (user-5-173-14-53.play-internet.pl. [5.173.14.53])
	by smtp.gmail.com with ESMTPSA id
	i137sm2859907lfe.43.2017.10.05.02.00.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 02:00:28 -0700 (PDT)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 11:00:14 +0200
Message-Id: <1507194014-6933-1-git-send-email-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] seabios: uri corrected to https
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
X-List-Received-Date: Thu, 05 Oct 2017 09:00:31 -0000

There's a problem with fetching SeaBIOS source code via http.
SeaBIOS server returns 308: Permanent Redirect which fails on
wget 1.17.1. The official source code uri goes to https, this
patch aligns SRC_URI to officialy provided by SeaBIOS team.

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 recipes-extended/seabios/seabios_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
index 5c095ac..144b13c 100644
--- a/recipes-extended/seabios/seabios_1.9.1.bb
+++ b/recipes-extended/seabios/seabios_1.9.1.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv3"
 SECTION = "firmware"
 
 SRC_URI = " \
-    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
+    https://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.gz \
     file://hostcc.patch \
     "
 
-- 
2.7.4


