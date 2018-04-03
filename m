Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B68EE00B01; Tue,  3 Apr 2018 07:00:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C59DE008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 07:00:09 -0700 (PDT)
Received: by mail-yb0-f193.google.com with SMTP id k199-v6so6200881ybk.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tNKsxtP3iBsZpSkyTmQT6qK2NONQHaEXIYUGERkqeLs=;
	b=OAwLyo5GXpIKBm9fONRRJUnzqmIqc9I5vMAe8BpIaPnxzROycFnRlcT6ARaV8lveGY
	R5WbSoP5QQb2PJ3kFQYt9yzfcE/TjjZlWhzRaBVn320LpSF6NGNHem9pfInDEMcDfLVc
	tJZkHKQoXm/2UCTBWBebgL5KgJfeEdihKozxGwLNCAQm0K0oLFr74ZqUI5ubK++IrCnQ
	FxCyZi2SySqJeS3k+E5n2fSsQ+aGK/auprQG7DgdjKeI2ciKhUGoTyETrCEXmQQXcyI/
	dWb3/rSOfELEVbGjT1VBWrqmhH+VwT4CGrUbRyMQHlGTLgElyW/BJpRuA+i5bHdQKvLu
	Anig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=tNKsxtP3iBsZpSkyTmQT6qK2NONQHaEXIYUGERkqeLs=;
	b=Q8g87MqXOW9NJhRNKns2nIQ2NBE+V8POB5lL4oKLCSa4CgEwvpTT3w9Grf8XWZkBds
	+JClD7+N+21xXkBTCMQr9RX/zih5qXe32R593XG9C0apF1atNn15qR5sThiuBSv56kFu
	LxegQKSHejiUhQ0PhsCTnRJ65qf3IvQd1yEZalAVKKtyNb5MWQUiMLin0SwaKLDiBMWy
	3AtjLM8KnXnIdtdbz02fie6aEnvtBM4MUKnVMXjHtnHJsx42YyM43MmhXjVXEhZqRWCY
	fBGkoldYgRnp3G+Vytyoy0DCtjW+w/UQxjWFXIqWvb5IzyNf++FvRpXJjPyw8Or65IUc
	eEzw==
X-Gm-Message-State: ALQs6tBs4kkuSGL7g+LmhoQvMDx5bbObpVPVzJvWJTdcMD1I03QyWQep
	z28OzBijhmucPnVMA8Lpk8TNIA2kXTAIY/3JOmc=
X-Google-Smtp-Source: AIpwx4/S0wy2N5xmcayHHjgPAaFQaH/5vlRQMBDcwOkCfcbdT0JNzDktYiMDs5UxD/uxltwY7eEbg4rMvW02x/nfmJc=
X-Received: by 2002:a25:7254:: with SMTP id
	n81-v6mr7628514ybc.469.1522764008969; 
	Tue, 03 Apr 2018 07:00:08 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 07:00:08 -0700 (PDT)
In-Reply-To: <1522402120-7482-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Apr 2018 10:00:08 -0400
X-Google-Sender-Auth: QxaDpDYBBq4MuBjxxhClsixuDM8
Message-ID: <CAPuovEK==AdaeuWt86E_NFiJUmbLU_-A9xXwLdCdPXZvhwBEuw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-wsme: 0.9.1 -> 0.9.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:00:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-wsme from 0.9.1 to 0.9.2.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce. This uprev should be safe. As always with these I will caveat
that if it is found to be incompatible with the 'pike' updates we will
bring back the old version and make use of PREF VERSION as required.

Mark

>  .../python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> index 0016e63..59e1ddb 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>
>  PYPI_PACKAGE = "WSME"
>
> -SRC_URI[md5sum] = "23b0269af3f4c1db8cfa35054703f0db"
> -SRC_URI[sha256sum] = "afdd3ba14f815837239d6dead652de460bd61a869e39430b459be77d1a928197"
> +SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
> +SRC_URI[sha256sum] = "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
>
>  inherit setuptools pypi
>
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

