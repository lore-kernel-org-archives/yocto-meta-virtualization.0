Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1077E00D57; Wed,  4 Oct 2017 03:41:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65EC8E00D48
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Oct 2017 03:41:18 -0700 (PDT)
Received: by mail-wm0-f44.google.com with SMTP id 196so8972003wma.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Oct 2017 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Nu12XSfJ+SbO7nG2D4AXjUyoIneZsBSltg5gcchT1Fc=;
	b=BTe0SJ477lYq/PhxoLpcdJvA0q6xB6LLHL2Mrpuq6wFwv+ikkjRm0FE5hK9tBPGRTr
	H0LTBnoM3ph5q7HKdY4YDC6Hqh0AKHdBMUT2gC5uvxM55kQf+IpxyFbq5rW//herFD7k
	xabHrWnZiWqbYJTdjWGKS+hxMSlZ2czXg2GzgxkvNLp/DVo/rHeHVzThAuG6cHTHVMhj
	b2AyQDW+M75Q6Wky+/iliSMlRxGsSRigF28DpJ0bQt3p/1Qs0vx/F/qoUVvSReEb0I91
	2t5rh4DmcKtLf0PEZAA93m0EM632RHJ4iJ5V7tn1B2sDdz1R1ysVxNHDrgfoVwu92ROq
	+0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nu12XSfJ+SbO7nG2D4AXjUyoIneZsBSltg5gcchT1Fc=;
	b=Y0d5oEhlefGH5M9Qz9leOmnkq0eTaumR5Wg1gn4dX8e4knsBJUUfGi28eYCeIU7fNf
	6YzbwetdRtXdej9XF5mn+c5BprQ+wQAYk1pfm873YBnTWt12ND2+HLTRPJYIFBTLWv3/
	I9msxohCdUrP2GT05YyFSK6ezNah0oCqVOvVCP1gBf0o7xl5dUg4oIc+hvJ+2bjFmfeU
	HbAKVMuWA5ul+189MJT+fizUppjoYoTWp4MzjlWvNETvZVSMN5XY58frRV4In3tF6jY4
	+WMYBrVQ4CjFlpoufddd2WoxztnvcQuG24eCU0Ldd9RR5zavWMOPQ0NjfITlEmPTVkNL
	94mA==
X-Gm-Message-State: AHPjjUimf7Ylm2NOimO+Oj1tMYh2zUbv9XxzM/KRjEEpnCmEzLxTWUul
	RIi1k4v+c+4ScuQ2c7YsEFRUQIxD
X-Google-Smtp-Source: AOwi7QDOU2aiGfT4sTpxTLFR5fJci9HAM7PlsgGmq62DEIJ4xZwgFNSCxgpsluM9IzjPbpqCQvzokg==
X-Received: by 10.28.214.212 with SMTP id n203mr13800397wmg.10.1507113678076; 
	Wed, 04 Oct 2017 03:41:18 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v2sm7115456wmf.8.2017.10.04.03.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 03:41:17 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Oct 2017 10:40:24 +0000
Message-Id: <1507113626-3022-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] runc-opencontainers updates
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
X-List-Received-Date: Wed, 04 Oct 2017 10:41:20 -0000

These changes fix the build for runc-opencontainers and upgrade to the latest
version (v1.0.0-rc4).

Paul Barker (2):
  runc-opencontainers: Update to v1.0.0-rc4
  runc-opencontainers: go.bbclass compile fixes

 recipes-containers/runc/runc-opencontainers_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.7.4


