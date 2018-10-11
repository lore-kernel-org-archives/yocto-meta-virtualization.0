Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6862DE00A9B; Thu, 11 Oct 2018 11:48:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB4AAE0090C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:48:06 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id z21-v6so9196800ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HPhFclAzjtw5YubizmaURuFvFdzdtofqed11OUSYf/4=;
	b=GV/qNGLZU18p1oZev9uJpxiKvJIepX6Vhk+4lR6LhTfK3N2OZ206luGQDqmXIx86vt
	sQphXT233rqi924YFvmbO2zKkMFTnfw4lo69lbgEFsT4CV8v/9A3tOKzJl6QOPwN/TZF
	SS9i3CxKhzxQpwn1CN6t02RkRRmJoiS6ACoJv72hfLiuSijkL2DQQJhQryv+u9NqdsWE
	eCSNR9ujHTWsJ0JQOH6PBIVnellFc93XqfO/NUeNNol90tHNY+1GeSd3dh2kH+pYLYAn
	mVe2Y85pgcxZiSmvHjxxbditsTgqMXwzBTmK9S0WAxg/dtedbSA0/tA/wWc6xnbsrUmN
	uwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HPhFclAzjtw5YubizmaURuFvFdzdtofqed11OUSYf/4=;
	b=UhAjFYCaR6sHhITyVnFfcb+aYIVFbZI//d/wCbcpYjvcSWzTmzYTpYa6mELlPq7iR2
	yyWFADpUpF7Hxu6+v+427vwJu4fHYvRPj+EfBgCM9idU7OL/Wq64Fl9p4c7oY0IGh2iE
	3UAqqzQbm+xfeSNXRZpo2KI3olLNMvWhOX56cTnkBs2yCmTsLzMcfiMjyx3FVICSA6iQ
	0ydZQTuPQLXcV7CXHLeaiKHRJnQY7+9urGGfIoOwWMYvucyjm8lNdMvI3ZO0gMUutEf6
	dZMEJ0DVN4aEN6DVEioelTCBPrUAWLrSX3gFtvUvNbl7dQ0+BPaZHfC/q29AwYdZ7Q59
	Bn4g==
X-Gm-Message-State: ABuFfohPuyStwgzDUz+GMNf8u7CCBv5aOm7ORU+BwsjZXtnjN5oNJPmn
	To6p993vgDNrW80bdndPUptx38PlHIxcEKp3r2C23Q==
X-Google-Smtp-Source: ACcGV62rG1wqOAJsKy7RNjuwKPe8DMUbFhVX4uJJlwulit/DS0fL/mbMOtV4/Aa/S9Y9bLZ3eEQTOPYkU44vUq1C4+Y=
X-Received: by 2002:a2e:8589:: with SMTP id
	b9-v6mr2015878lji.122.1539283685593; 
	Thu, 11 Oct 2018 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
	<1539229819-322989-2-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1539229819-322989-2-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:47:54 -0400
Message-ID: <CADkTA4O2Cvk3V7ecsyACv1+ANwHcWDY-irs4dPkEXnhgACG6SQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][PATCH v2 2/3] layer.conf: set PREFERRED_VERSION for python-networkx
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
X-List-Received-Date: Thu, 11 Oct 2018 18:48:07 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 11:51 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Only set PREFERRED_VERSION for python-networkx
> when the openstack distro is enabled
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta-openstack/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index f322bcd..598e157 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -32,7 +32,7 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
>  PREFERRED_VERSION_python-eventlet = "0.20.0"
>  PREFERRED_VERSION_python-warlock = "1.2.0"
>  PREFERRED_VERSION_python-jsonschema = "2.6.0"
> -PREFERRED_VERSION_python-networkx = "1.11"
> +PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
>  PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>
>  # Sanity check for meta-openstack layer.
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

