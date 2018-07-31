Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFF6AE00CB2; Tue, 31 Jul 2018 12:36:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFFBEE00CA1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:03 -0700 (PDT)
Received: by mail-pg1-f193.google.com with SMTP id y4-v6so9565852pgp.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bRmUdrxfDvgArzkpmfHOd81tqGMGHUVga5F/aJDNv4k=;
	b=Q2LGYOJ9colWdmCJ6w1octlPJNsVF08uti8hvfc/cJjQ3aKl/6nMs2yehyCxAv+U+H
	y3lt8HjU6I6Nn4YT+x7VpajW/2dpOSGdBSyWjQW7bSs+eR7PlEfBvNS5Khk4DE/dMAR4
	j8jO7iOcUPCWDPMGSTrw9PLUEU/SX4bC6569gHG7wiYfOPDXezXSdyIHkm24QnxGS/4m
	iqqI9EZaY9ZonNgOrJKJucQx8dPcvlNhmeXI8AeJkDKf5+surXrmhO8ifFOkhxdSVhIg
	PdZcSvyPqZ2IeG1kWMUrO6oepU1hxpY5O49zAGfBW2BtmG1A6OD1+oktt1HNvU0Wzv0M
	80hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bRmUdrxfDvgArzkpmfHOd81tqGMGHUVga5F/aJDNv4k=;
	b=NY4gQ6RvwOdLrB1f1nGlCgDfJn0z0UQVM7CrYTfA0y5s5m7y8R+521vslCs2hELbpR
	bihqPrku7FiB3q0h1IvkIMTXG5n0U0yH019LVWUAiWeCNma3910aG/dujSSMnk4o7ndk
	xf1J/azgsSE0IGK9sTEqzY/6OOoTTSRB+2vQs4qKYr0VQDeDWGdHYiTjxdQaIswlo0x4
	GJyyo3sA3WFWdxJfESGFPhVhGazBlJvDfVp2vSN6pWXoivqFGvL/Kygg41kjSLp/Ll4u
	kBp9PsjtetJghiSi9aSrUCw7xwwXI9VoLNY+BdvVOFsBGpq7Pqu69dsYR0CmL5p+B72W
	NaFw==
X-Gm-Message-State: AOUpUlGcuK/u9+/mcOzNwzA9VAlzZjXrO8eWoipEaOxs2hTniRL8UrDJ
	nYopNHJ1LLWGmFTLYQLjPFYzuPEs
X-Google-Smtp-Source: AAOMgpcqM0PbSoGA4eZylwNtQiBoT6E+TqLTkpWSwovXWtBunrPxNfd9HwO86uGNnkWtNRVXgcviSg==
X-Received: by 2002:a62:90d4:: with SMTP id
	q81-v6mr23833109pfk.37.1533065762917; 
	Tue, 31 Jul 2018 12:36:02 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:01 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:41 -0700
Message-Id: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH v2 0/9] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:04 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This patch series:
* Fixes Xen recipe compatibility with gcc 8.1
* Adds the Xen recipe for Xen's current version: 4.11.0
* Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
    - provided to ease backport to older branches (eg. sumo)
* Adds packaging for the Xen shim component and depriv-fd-checker
* Removes the 4.10.1 and 4.9.1 recipes
    - superceded by version 4.11.0
* Upgrades the vtpm stubdomains to Xen version 4.11.0
* Applies a bug fix patch to the tpm emulator
* Fixes whitespace patch fuzz on a vtpm patch
* Updates the Xen git recipe to build upstream staging
* Applies a workaround for an upstream parallel build bug

Changes since version 1:
* Use simpler workaround for the upstream parallel build bug
  (just build the hypervisor before the tools)
* Add packaging for the new depriv-fd-checker tool

Christopher Clark (9):
  xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility
  xen: add recipe for 4.11.0
  tpm-emulator: apply patch to fix memcmp defect found by gcc
  xen-vtpm,mini-os : upgrade to Xen 4.11.0
  xen-vtpm : fix patch fuzz, whitespace-only change
  xen: remove 4.9.1 recipe and patches no longer required
  xen: remove 4.10.1 recipe and patches no longer required
  xen: package depriv-fd-checker
  xen: Update git recipe to build latest upstream staging branch

 ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 ---------------------
 ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 -------------
 .../xen/files/mini-os_udivmoddi4-gcc7.patch        |  43 -----
 .../xen/files/tools-xentop-vwprintw.patch          |  25 +++
 .../xen/files/vtpm-deepquote-anyloc.patch          |   8 +-
 .../xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch  |  28 ++++
 recipes-extended/xen/files/xsa246-4.9.patch        |  74 ---------
 recipes-extended/xen/files/xsa248.patch            | 164 -------------------
 recipes-extended/xen/files/xsa249.patch            |  42 -----
 recipes-extended/xen/files/xsa250.patch            |  67 --------
 recipes-extended/xen/files/xsa251.patch            |  21 ---
 recipes-extended/xen/files/xsa253.patch            |  26 ---
 recipes-extended/xen/mini-os_4.11.0.bb             |  17 ++
 recipes-extended/xen/mini-os_4.9.0.bb              |  18 ---
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |   1 +
 recipes-extended/xen/xen-vtpm_4.11.0.bb            |  21 +++
 recipes-extended/xen/xen-vtpm_4.9.0.bb             |  21 ---
 recipes-extended/xen/xen.inc                       |  15 ++
 recipes-extended/xen/xen_4.10.0.bb                 |  12 --
 recipes-extended/xen/xen_4.11.0.bb                 |  12 ++
 recipes-extended/xen/xen_4.9.1.bb                  |  18 ---
 recipes-extended/xen/xen_git.bb                    |   7 +-
 22 files changed, 127 insertions(+), 798 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
 delete mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
 delete mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
 create mode 100644 recipes-extended/xen/files/tools-xentop-vwprintw.patch
 create mode 100644 recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch
 delete mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
 delete mode 100644 recipes-extended/xen/files/xsa248.patch
 delete mode 100644 recipes-extended/xen/files/xsa249.patch
 delete mode 100644 recipes-extended/xen/files/xsa250.patch
 delete mode 100644 recipes-extended/xen/files/xsa251.patch
 delete mode 100644 recipes-extended/xen/files/xsa253.patch
 create mode 100644 recipes-extended/xen/mini-os_4.11.0.bb
 delete mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
 create mode 100644 recipes-extended/xen/xen-vtpm_4.11.0.bb
 delete mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb
 delete mode 100644 recipes-extended/xen/xen_4.10.0.bb
 create mode 100644 recipes-extended/xen/xen_4.11.0.bb
 delete mode 100644 recipes-extended/xen/xen_4.9.1.bb

-- 
2.7.4


