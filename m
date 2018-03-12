Return-Path: <ricardo@opensourcefoundries.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C9CCE00DC9; Mon, 12 Mar 2018 15:33:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00, DATE_IN_PAST_12_24, 
	DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.160.66 listed in list.dnswl.org]
	* 1.0 DATE_IN_PAST_12_24 Date: is 12 to 24 hours before Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F8A2E009CF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Mar 2018 15:33:50 -0700 (PDT)
Received: by mail-pl0-f66.google.com with SMTP id v9-v6so10165582plp.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Mar 2018 15:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dwKglKpDfcAtyDWtIjlOjS8i9Gk7Jp4o8wvdPzUzCBM=;
	b=Sq/fCbHo/9Pe+7MvN0wDSZNn8IMV0jwe6ZFwIxxSr3GlYEJlts89bE0QfFnVdM+38M
	lQxvEwwA5M9iFtsamFj6H1cYxTDAOubxE7FMaUX74fn2vBrNaW5+WUaECjZtNAwq/cnG
	4wOnuuw12HI99lfkbUOW6/zJfclcVXhC8ZB4unANwadZMDDUOJl9rJ9+psfiIMLm+D9r
	dl0iTsvMe2z0LB9Zf0IPX4OfLBitoX8Vg7KbEc/IXdBy2S3rieRr/au1qVE/VT9Myfpp
	cjtwTFqCfBdordjRgaS4+vep+7jRuq/YO4F7ZQOwTLM0IkcpWkgwD2r7xpaVn7P+mxEg
	2CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dwKglKpDfcAtyDWtIjlOjS8i9Gk7Jp4o8wvdPzUzCBM=;
	b=Z1bO24utBjU49N0dA8+WwkzGNxoFd8Q0L8f6b8K5EWEmPLyspBT3lSxXURgmkiz8EE
	DSVUd0Pq2NYRYOgFAT8uzp+aLklOfmWgp4NX7iQCxWqH6WhNvnwmTDqom4qK64eoIx+6
	wB//30PD5DKZsf59ZbWH3tGZpfXQ0mwKaj2dwwXY+dXcMWouolIyWXo12hf/C62fXOp4
	yxebMRhsmVzuMhL78/odoVi07jRGDgDy3K6tgPow2gFWWY1rgxyT/gRPqnRYBXurCqL/
	SJEeq7XsDyp2AaThDeOr+sIPy4mw5Su9g4kVgrVM+XnieBR+NP66+tu2AohI7/EhLF6s
	2+WA==
X-Gm-Message-State: AElRT7F1j8mkcxmhpqQ/NAJsq/2sgNp6IcPYCdYbcJLkHWhOAhmkDy6n
	GpqstMPPmDE5EABp+KJNNB49eiFXSg==
X-Google-Smtp-Source: AG47ELsfv4wMuWHBhh1/iV4/ST4bnKe7snteUdxovZxYoqfD7GOJAk52VzIFs3e4nRpxYM+TuG9Z1g==
X-Received: by 2002:a17:902:7717:: with SMTP id
	n23-v6mr9454570pll.388.1520894029950; 
	Mon, 12 Mar 2018 15:33:49 -0700 (PDT)
Received: from evabox.event.rightround.com ([65.153.83.185])
	by smtp.gmail.com with ESMTPSA id
	n13sm18609672pfg.45.2018.03.12.15.33.48
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Mar 2018 15:33:48 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 12 Mar 2018 06:23:29 -0300
Message-Id: <1520846609-5799-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-docker-compose: remove deprecated python3-enum from RDEPENDS
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
X-List-Received-Date: Mon, 12 Mar 2018 22:33:52 -0000

The python3-enum package was removed and it is now part of core.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
index 4e761d0..851c251 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
@@ -19,7 +19,6 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-docker-pycreds \
   ${PYTHON_PN}-dockerpty \
   ${PYTHON_PN}-docopt \
-  ${PYTHON_PN}-enum \
   ${PYTHON_PN}-idna \
   ${PYTHON_PN}-jsonschema \
   ${PYTHON_PN}-pyyaml \
-- 
2.7.4


