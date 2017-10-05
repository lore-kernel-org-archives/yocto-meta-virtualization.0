Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2C67E00D7E; Thu,  5 Oct 2017 06:39:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40CF6E00D69
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 06:39:01 -0700 (PDT)
Received: by mail-wr0-f172.google.com with SMTP id y44so5536029wrd.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KFRXdVrIIk70+3z/IunHHLXNyeSgVt2vEC8hwgakJn8=;
	b=jh7Ojq7HBFcWpGr+mxJBxERkKRAu2AgtNSTdJRJe+V5ogjFaa6+7xNHmMEUU9ar31P
	GV4xAXh/pnU2EH/ZRnYXlz8151vzif+QXpETX1nFs6tXtfVETKDjPnzmapwm+WDabAth
	D0cCBcrWL9L6xPBOyaQGPAXayf3JD0KxKkLU3ltWUa3rYgkQA2XhJ50fsImDwiEoYj64
	ZGWtGVj4GQuTJOKV47cJX85cfSvHa/MiDbzJ0vFhKifOpZoFbd719yr1kHPos6qCYMTY
	8s2q2/xbzHlkBtLC9brZm/vj69IpcEVq0ie+y3fLsCeJMitt1GhWhwMqa+HpEEnfSgM2
	plWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KFRXdVrIIk70+3z/IunHHLXNyeSgVt2vEC8hwgakJn8=;
	b=pdFFJ5vNarEvw+5IWdI02jaS0nMANcEHNkJt4FlCVDaRCEDouT6k4M7WKoFWCSqMmU
	OhcDsQh8y4vQJsuYc6ndYzgm2x0QSmXQmui7NrM9icoup2N1aD/qv55B/apldSRdcttJ
	GZiZmNGTftVsSEjsKfmVJMvV6pQEiInhaT6v1OYAvzuhrPgJ4+Qvjri/57tvYj705hdM
	EVDzAQ8pJVlhv8DYClj2PU4/M1YOF7XzYbLtpHzB/JGCWgiPfI6h1JALblvs3pLfgkul
	k/LCNLmP/Iq6q7kMVOi2VW+1Pn0+YRKYW2G1CoL2VrWoHJXI7wM1LcvOoe7n6q7TJPw9
	5KBw==
X-Gm-Message-State: AMCzsaVklZuGsEm8iplk4QFr7dzuh8HJmiJil2uTg50LpgQr10TIMnKn
	fdZKE1LyRVLVpqMkTLBqnYSipu3XqM4=
X-Google-Smtp-Source: AOwi7QBDyj7QhuIDMZgk/GcWW8Zmcr5Q8Opid/3w7EIfi2Kyg/Czdcum/SIlVwsEPfKvOe5kDsI52A==
X-Received: by 10.223.135.142 with SMTP id b14mr9296170wrb.277.1507210740698; 
	Thu, 05 Oct 2017 06:39:00 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v3sm6749043wra.39.2017.10.05.06.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 06:38:59 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 13:38:15 +0000
Message-Id: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] netns update and runc fixes
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
X-List-Received-Date: Thu, 05 Oct 2017 13:39:03 -0000

* Update netns to the latest release.

* Fix runc compilation problems when targeting qemux86-64. Both runc-docker and
  runc-opencontainers have been build tested with these changes.

* Drop an old patch which is no longer used.

Paul Barker (4):
  netns: Update to v0.2.1
  runc: Drop obsolete patch
  runc: Use correct go cross-compiler
  runc: Don't override GOARCH or GOROOT

 .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |  3 +
 .../0001-Use-correct-go-cross-compiler.patch       | 85 ++++++++++++++++++++++
 recipes-containers/runc/runc-opencontainers_git.bb |  5 +-
 recipes-containers/runc/runc.inc                   |  3 -
 .../0001-nsexec-fix-build-against-musl-libc.patch  | 48 ------------
 recipes-networking/netns/netns_git.bb              |  9 ++-
 7 files changed, 182 insertions(+), 56 deletions(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-Use-correct-go-cross-compiler.patch
 create mode 100644 recipes-containers/runc/runc-opencontainers/0001-Use-correct-go-cross-compiler.patch
 delete mode 100644 recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch

-- 
2.7.4


