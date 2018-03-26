Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 991D6E009C8; Mon, 26 Mar 2018 11:27:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5DC4E0086B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:27:47 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id x72-v6so3089441ybe.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8pzvMA/L3AiA9APhr45r9nniKU4/hVLUqZ+DNijSTaQ=;
	b=K4UVKbNxw24dXikdHNMUmlFPD9EhCCYpDOAqzK1KiHTFQ3vddq19BqovkFWsvtM6cq
	2kXTpa7u6ozbBu3T9nIF2v+YEN99NerbM7w7VPh/IJkeGQXqELkVtrtO4RGeV+6Hgk+o
	EPEpd9M0dR7diViVPiJnHs/WxW5o+HflJ2iNWm3yfFR4JM7mdUvf2I4DleZFTlxoS47G
	3arTbAGxzFonh/dnqtp3HPJ8ChDkcXRZfOh5allTcJNyognAcT/n3o4qiiCS9kvJTXF1
	bc1bWwAdrZ2Z+cbQbn04xOloVT/QTlvbr/axuCEIFCySqn3QIMV1Cm63rNM4Zfu0MI6J
	vmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8pzvMA/L3AiA9APhr45r9nniKU4/hVLUqZ+DNijSTaQ=;
	b=pBVTvVmVqkm2LlXX5A5z40dzEIt+CdOzGAk51wA6aZg6I2HeBhrD/ZgQs7T3KvL0qN
	pfWI3+NaVw7IJS75H48Ov3sXJNE4wKJimEWr2j3/g01A1SgxfzwiTIxZ/7GVNIvRFFp+
	rqWZLMFT6/nFdgi9p8tf7ErGyW+kYo2D380n8l7HX4TDCneqO2X4eR3h3ELGyglrgJmr
	zTEkUfGUB4squdqP9OB0ycnA7TOsSGg6ltKz5ha3WPSp9ghDaCG/8Li2VjfKFd4ZgtHe
	J7hOG6nzq9A+PR6i7WCdb+DRmWv111ZtXeQIDocDJUjPZ8NLfNKZH04tSn71w+xx2e0E
	CDFg==
X-Gm-Message-State: AElRT7E9aQKUg+LP1gUbrHKKdXOw6wmUZsKe4oP2Gr29qQP7OrJvQfm/
	q1NFtWeW/0RYnKvKTw3IpteqIkkPm3eOfI9Mi6/IPA==
X-Google-Smtp-Source: AG47ELu92F4y3jZS2aSKd6pfleGknXY2nE5XCxU4xt46rm+S/DyiJgqFOq/FUdonRErVlRPO94iVNTeIyffzgnbqZZA=
X-Received: by 2002:a25:1942:: with SMTP id
	63-v6mr23967635ybz.129.1522088866917; 
	Mon, 26 Mar 2018 11:27:46 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:27:46
	-0700 (PDT)
In-Reply-To: <1522030294-809-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522030294-809-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522030294-809-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:27:46 -0400
X-Google-Sender-Auth: b_sL6vqJ3hWKjc_fF6xEpk3akYg
Message-ID: <CAPuovEK7i5xMJck21admadfjq7dGmost+bwEZZHbWbLK1gpcpg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-swiftclient: 3.2.0 -> 3.5.0
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
X-List-Received-Date: Mon, 26 Mar 2018 18:27:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 25, 2018 at 10:11 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-swiftclient from 3.2.0 to 3.5.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce,

This should be safe to merge.

Mark


>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index 2d5f83b..f668155 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>
>  SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
>
> -PV = "3.2.0+git${SRCPV}"
> -SRCREV = "5a620f83e88d1b52e013cedff4bc266bcf3c292a"
> +PV = "3.5.0+git${SRCPV}"
> +SRCREV = "b91651eba09ed43903c55f24e3a1a52aefeea75f"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools python-dir
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

