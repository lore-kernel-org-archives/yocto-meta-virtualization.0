Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7D86E00DEF; Mon,  8 Jan 2018 23:12:58 -0800 (PST)
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
	*      [209.85.214.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 627ABE00C78
	for <meta-virtualization@yoctoproject.org>;
	Mon,  8 Jan 2018 23:12:57 -0800 (PST)
Received: by mail-it0-f65.google.com with SMTP id b77so7272578itd.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 08 Jan 2018 23:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=020hJn/n1JuabCA1xxRUAL0x+KiycJ+97WcMPseJFOo=;
	b=QuvmC+gdAZgIrjHSY1vNyC5E6xUkUSTBR4PHoq19M6II3r5XwKBhtNg0FbVPxqddyo
	Uok4eEIO2QcZ5xOQQWUHtOQF5N/WaUwQF4zpZoLNrMsb4Mye+MFkYmnlJ+SmI9KuoA0a
	tubj8uM/EgQjdObx4/CWuc0Gg0vviDYlqID6tG1X3mJ+B3Z+wY65GDxMfyRv0DYvsa85
	7gfVTIigP3tzOoz4PyZodXcvDggTJqojiHDFAI5q+QkRu/oXBR/X1a01fE0sKrlojf8B
	AALz4w0t91+V58xS8KwWRF8ug6DvbXMGxbna558yiiQM56B9dHMdOb1bhzUBCagM2Ern
	cFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=020hJn/n1JuabCA1xxRUAL0x+KiycJ+97WcMPseJFOo=;
	b=BegXbCKn0jWGuqkjDWtZOO5pzh2MuARn4nlqWdmrtsSi1pn+3zDM99RhdyxFz0IXQ+
	jAH1sxuuDaMRL6ts/blr7VCtFcI/M7TFhQeVtd5Ev0DU2/wo6X1thWyj2FsUThS1pils
	PoQoyN4udT7qh0GjPalK2QnwSiV6VxV+x+KazH1+Aa/XG59E1wquLYwmn8XRFW3KvwbB
	qW1AMjoebQ1CDIUB1ymBw0D6oR6bbdMMD33dtfBXIVHY2t3B03tFRNh7ctOrRfC6owF8
	9rUoLwXqszofqqQKvBth3Ii6G5CEiOnQZECYtj89BK1YhJE1+hd3sfUnSsLOSlNujH9+
	8djA==
X-Gm-Message-State: AKwxyteBOnnfvqMBaZ6laoEpsupZyfjMq4WZyU0Ex4xYHEWHGdOfEmka
	WzUVg8kn1SQudhOOhxDaml8TEsNl
X-Google-Smtp-Source: ACJfBouWoLCbibJAxU0FBHybPhisrxgOGL978N929cbTN4GOaE4pH3X1ORn+LGwjkS086ANrRL2y0w==
X-Received: by 10.36.239.197 with SMTP id i188mr6472025ith.57.1515481977257;
	Mon, 08 Jan 2018 23:12:57 -0800 (PST)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	y64sm7725921ioy.25.2018.01.08.23.12.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 23:12:55 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  8 Jan 2018 23:12:43 -0800
Message-Id: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH 0/5] Upgrade Xen to 4.10.0, 4.9.1 and apply XSA patches
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
X-List-Received-Date: Tue, 09 Jan 2018 07:12:59 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

A short patch series to:

* Introduce support for Xen 4.10.0
    - package a new library, libxentoolcore, and a new tool, xen-diag
    - make the deprecated blktap packages optional for xen-base
      -- it no longer RDEPENDS upon them, but RRECOMMENDS instead
      to retain xen.inc compatability with earlier Xen releases
    - and apply a patch for XSA-253 / CVE-2018-5244

* Upgrade the Xen 4.9 series recipe to latest 4.9.1
    - and apply XSA/CVE patches

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>

(Please use my gmail address for correspondence.)

Christopher Clark (5):
  xen: upgrade 4.9.x recipe to 4.9.1 and apply XSA/CVE fix patches
  xen: Package libxentoolcore and xen-diag, introduced in Xen 4.10
  xen: xen.inc: remove xen-blktap from xen-base RDEPENDS
  xen: add recipe for Xen 4.10.0
  xen: Apply patch for CVE-2018-5244 / XSA-253

 ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 +++++++++++++++++++++
 ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 +++++++++++++
 ...x-libxc-xc_dom_arm-missing-initialization.patch |  36 -----
 recipes-extended/xen/files/xsa246-4.9.patch        |  74 +++++++++
 recipes-extended/xen/files/xsa248.patch            | 164 +++++++++++++++++++
 recipes-extended/xen/files/xsa249.patch            |  42 +++++
 recipes-extended/xen/files/xsa250.patch            |  67 ++++++++
 recipes-extended/xen/files/xsa251.patch            |  21 +++
 recipes-extended/xen/files/xsa253.patch            |  26 +++
 recipes-extended/xen/xen.inc                       |  15 +-
 recipes-extended/xen/xen_4.10.0.bb                 |  12 ++
 recipes-extended/xen/xen_4.9.0.bb                  |  12 --
 recipes-extended/xen/xen_4.9.1.bb                  |  18 +++
 13 files changed, 721 insertions(+), 51 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
 create mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
 delete mode 100644 recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
 create mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
 create mode 100644 recipes-extended/xen/files/xsa248.patch
 create mode 100644 recipes-extended/xen/files/xsa249.patch
 create mode 100644 recipes-extended/xen/files/xsa250.patch
 create mode 100644 recipes-extended/xen/files/xsa251.patch
 create mode 100644 recipes-extended/xen/files/xsa253.patch
 create mode 100644 recipes-extended/xen/xen_4.10.0.bb
 delete mode 100644 recipes-extended/xen/xen_4.9.0.bb
 create mode 100644 recipes-extended/xen/xen_4.9.1.bb

-- 
2.7.4


