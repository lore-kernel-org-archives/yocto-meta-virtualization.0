Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2ACD9E00AB3; Mon, 10 Sep 2018 16:30:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 524 seconds by postgrey-1.32 at yocto-www;
	Mon, 10 Sep 2018 16:30:09 PDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26EC5E00A73
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Sep 2018 16:30:09 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 10F315C02F9;
	Tue, 11 Sep 2018 01:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1536621684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=sNDEdW27NZUWe4SipEczp7O5VYMpxL4pFS0dim264do=;
	b=aG6mYMaMJ9pAmQtBvQiBZAVgF1od0N+29OZthwbd55G7l1Y6qlbbHpJBK+B59v7lwS5oBk
	AoEibQ7Y6b0GpcLLelDRdcw2vW3H8xfrKnzg4kHlk8Ax3EUVs1PdPOXOLmdzlb7z5t78d4
	qn2brqjn8qoOG+SvdpDVsYKPfBE3trU=
MIME-Version: 1.0
Date: Mon, 10 Sep 2018 16:21:23 -0700
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Message-ID: <a9421b92abcdbc3c76f9bd6783cc0c5a@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
Cc: bruce.ashfield@windriver.com, Brandon Shibley <brandon.shibley@toradex.com>
Subject: OpenEmbedded Image Format
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
X-List-Received-Date: Mon, 10 Sep 2018 23:30:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Is there a OpenEmbedded image type which allows to build images which
are OCI Image Format compliant? meta-virtualization includes the
oci-image-tools, hence the recipe for tooling is there. There is
currently no -native support for oci-image-tool and its dependencies,
but I guess that shouldn't be too far away. Any thoughts?

--
Stefan

