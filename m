Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE435E00CC9; Tue,  8 Sep 2015 07:12:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.175 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56D1BE00AF0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Sep 2015 07:12:31 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so44645365ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Sep 2015 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bcE/IhlsvBoaV3bZTcPtU+9sBFpw2vnBtZ/+/qfYxdk=;
	b=lXwx7dKowvkiuM1a6E6vz+7buR4jCDojs5FVsSLETX2emM1YyYTf0WTm9VDbQfy4lO
	OseIME/lwH1PKCdf8NSFTJERkOuq9dE5Fn8ReZ6pW741B7uQH+vIwtS/1kPRZfGFTsmx
	UHxoiTKDPndqLN/zqOelGXfDeGG8fjANOMRmNHDJWSuEc/GF9Da7+8MNQPweqP5bv9q2
	BfixwgJCxIT3jSgElggjgQ29PTdrjLUxFcIK+siyYAPmiNJxiai33HpWDUj1ZLsvnS7i
	nvMqf2a+3aDmpACdNPpVKTyMa2l1pQtCTcA5emGMlFx14HwwesK4SgOgmETvs9MTqDq6
	hD0Q==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr26917413ywf.13.1441721550780; 
	Tue, 08 Sep 2015 07:12:30 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Tue, 8 Sep 2015 07:12:30 -0700 (PDT)
In-Reply-To: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
References: <1441379737-16799-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 8 Sep 2015 10:12:30 -0400
Message-ID: <CADkTA4MZp_wp1rxiWbaouH--7NwtLKjN6GFiYV=UwMGG4Thr1w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][kilo][PATCH 1/2] python-sqlparse: add recipe
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
X-List-Received-Date: Tue, 08 Sep 2015 14:12:33 -0000
Content-Type: text/plain; charset=UTF-8

merged to fido

Bruce

On Fri, Sep 4, 2015 at 11:15 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  .../recipes-devtools/python/python-sqlparse_0.1.16.bb       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
> new file mode 100644
> index 0000000..acfc3cb
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "sqlparse is a non-validating SQL parser module."
> +HOMEPAGE = "https://github.com/andialbrecht/sqlparse"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
> +
> +SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
> +SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +
> +inherit pypi
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

