Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC62AE00C77; Wed, 30 Aug 2017 06:20:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFA79E00C14
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 06:20:05 -0700 (PDT)
Received: by mail-wm0-f65.google.com with SMTP id i76so1769772wme.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E9FfPBpFIFrnccBHz1kN7qan/46pMkT404Cjer/dsnk=;
	b=vCN/kn/71AlqjUzhmuZU3/JqsI2dJsb7Xzw506tpc2RLytjUwnw8AQYNhAPnqLqw2i
	39jZBrs5Tz2gUzW9VhIt4LpA/tDsM4qZAOcqxXRkRmJ5m7dAhmil6MUiGwRwaHJEqLwH
	oSWhVX/QKTeVwZMZUwF/tB5qNXEwNV7/npqvoHchQl1m2MYTQauVY12g+CcGiuizqMaB
	SLlHFXZfwouWJHq87VmFAoqSJLLewFUHUzYJOKe5MZ0TO+pn/VZlGXjEFuxhZ35JZUew
	IeR0eI4jWaudy8rv+JPiHz1w36zu6I6F6BK5XStUpLJl8+6CkYM9tYXyyYqtcUEsV+En
	WbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E9FfPBpFIFrnccBHz1kN7qan/46pMkT404Cjer/dsnk=;
	b=XviEEmDubovxwuXpjXea/H026waEDw8hcHi1tH0C68/UdTO8d4Ng0IW3GOuCtNEWn+
	C0gUyfbiziqqBiLQmLCOh7sI/IF+D69gJynOcePrxArXUXsD6LCflex81JbmZOqsTzKc
	WCcc/F0e9IWctWh9Ca2W63h/ckROAIO7qS6fRXQ0IJdLaO/VlyWP5iVUCenuS+2t7MsT
	sMWiIsB8y4JlR3W02wHw8OYjyyvMoVChicNzP5qY379oOKETZ6UiAsGEQ7kQ1xsaNs8q
	sodyRzBhIy1r60SFLfy4RUTJNNCPZQz+mOjW0tGywErMAT4lIxO6PBuyo62quVkW7zox
	x+dA==
X-Gm-Message-State: AHYfb5iWnWD66V/hvpeB7iLWemo1bbnlUtj75IexojYtwJiBF5U0Zs2j
	/uaN/T3zjWdMmGavXE4=
X-Received: by 10.28.23.132 with SMTP id 126mr1287003wmx.111.1504099204352;
	Wed, 30 Aug 2017 06:20:04 -0700 (PDT)
Received: from localhost.localdomain (boldrewood.soton.ac.uk. [152.78.0.15])
	by smtp.gmail.com with ESMTPSA id
	u46sm7594017wrf.15.2017.08.30.06.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Aug 2017 06:20:03 -0700 (PDT)
From: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 30 Aug 2017 14:20:02 +0100
Message-Id: <1504099202-93864-1-git-send-email-tiniuc.alexandru@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Added dependency to Bash
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
X-List-Received-Date: Wed, 30 Aug 2017 13:20:06 -0000

If Bash is not included by any other recipe, the recipe fails at the QA
check. This commit adds Bash to the list of dependencies, preventing
this issue.

Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
---
 recipes-containers/singularity/singularity_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index d0fbeb9..8b97740 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -2,7 +2,7 @@
 # Singularity build / config: read up on the dev-so test for more info)
 INSANE_SKIP_${PN} += "dev-so"
 
-RDEPENDS_${PN} += "glibc python3 ca-certificates openssl"
+RDEPENDS_${PN} += "glibc python3 ca-certificates openssl bash"
 # Singularity expects to find python3 under the name python, therefore both
 # cannot be installed at the same time.
 RCONFLICTS_${PN} = "python"
-- 
2.1.4


