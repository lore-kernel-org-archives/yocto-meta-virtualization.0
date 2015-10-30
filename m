Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7B87E00BFF; Fri, 30 Oct 2015 05:40:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1A4DE00BCC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:40:30 -0700 (PDT)
Received: by ykek133 with SMTP id k133so74343226yke.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U/GqSgMRB0J49Lb2jxGTop+2LtcQPrVj01VXiymwi9M=;
	b=qmtNlDvUAlbvdD2KTiqh86qdR+i28x7rdPqKCIZnDzFSSA7ABiZVtnAxsxI+srQ0pN
	r5APXGG8H/hxSIzK8k3UqytLQDFZaLqGFWI+4LsxAu6MULZIX42lBfrLwIKbnKXm9xBf
	94ONDkav3vhlrjYURBXkYT51uMkNAXONsPKhnPnnXjimrE/NXJMBv4ZxUvix6RZvhhZB
	Njnt54Xn4/rWrFpjcxex4gQA/gLqa8PKY3GLRoO8RvSQuRNJjYwlLpekVy8eaR6ymH8N
	c35p3AR/5VzU5pCa8mFo5bD/C/PYKOUDH/5leFDm+OIzVX5hrSwvr5Wl7nFWxR0xKUZk
	+peQ==
MIME-Version: 1.0
X-Received: by 10.13.254.69 with SMTP id o66mr5912590ywf.252.1446208830001;
	Fri, 30 Oct 2015 05:40:30 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Fri, 30 Oct 2015 05:40:29 -0700 (PDT)
In-Reply-To: <1445522645-3618-1-git-send-email-adrian.ratiu@ni.com>
References: <1445522645-3618-1-git-send-email-adrian.ratiu@ni.com>
Date: Fri, 30 Oct 2015 08:40:29 -0400
Message-ID: <CADkTA4PJHVUYSieyicw0017VC=_6_ggivVYr=PBAT5F0KCVg1w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-sqlite: add SRC_URI checksums
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
X-List-Received-Date: Fri, 30 Oct 2015 12:40:42 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Oct 22, 2015 at 10:04 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  recipes-devtools/go/go-sqlite_hg.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-devtools/go/go-sqlite_hg.bb b/recipes-devtools/go/go-sqlite_hg.bb
> index c5bc6ce..ebda84d 100644
> --- a/recipes-devtools/go/go-sqlite_hg.bb
> +++ b/recipes-devtools/go/go-sqlite_hg.bb
> @@ -11,6 +11,9 @@ SRC_URI = "hg://code.google.com/p;module=gosqlite"
>
>  SRCREV = "74691fb6f83716190870cde1b658538dd4b18eb0"
>
> +SRC_URI[md5sum] = "04bb4682d0113d5dbcd4a1dbf6b24dfc"
> +SRC_URI[sha256sum] = "478967fee730b85a6a4f96ace1e08fe91b6dfa6d641856bcd4574baec2f0361c"
> +
>  S = "${WORKDIR}/${SRCNAME}"
>
>  do_install() {
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

