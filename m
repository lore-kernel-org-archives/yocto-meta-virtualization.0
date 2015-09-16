Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74458E00E25; Wed, 16 Sep 2015 13:05:54 -0700 (PDT)
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
	*      [209.85.160.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3015DE00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:51 -0700 (PDT)
Received: by ykdt18 with SMTP id t18so210522286ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=q9XytlTQqGZAL4WYZY6IBKT+sXr/uZKFo3/my29bhRA=;
	b=tPnTmZUbv3sveb4slY4P0qICBBmjmF87lGNmrJA6S5OLflamT3gnn+NF2w03TwIrId
	3yIHf8sMWJQ/hwRQNETAqGPYHDF1BrRcKlUzMZ2WjE+XHibh7JMrNUanMzDaDExmvhqH
	Uji+Eg4k59RUFm6JttsnZ9hgRQBFZLMWFkzbSJtcYPFRdyODrWToBASmuj9xOQKkp8Uk
	F7m+nR94gXBiK6IhMpcE4aL3uFZ9KWL2AoLR4GxvRU99NzEqZXHcHRkRUGe+2ol8ITDa
	B5Zdf1ghFfRb4UMRhwGE01ucuRY/02Fv92V7GpWV7wU3Zms2TR0i+G4jjrLH6ty5gbr+
	wEMA==
MIME-Version: 1.0
X-Received: by 10.129.73.203 with SMTP id w194mr28848408ywa.16.1442433951198; 
	Wed, 16 Sep 2015 13:05:51 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:05:51 -0700 (PDT)
In-Reply-To: <1442315235-4401-1-git-send-email-josep.puigdemont@enea.com>
References: <1442315235-4401-1-git-send-email-josep.puigdemont@enea.com>
Date: Wed, 16 Sep 2015 16:05:51 -0400
Message-ID: <CADkTA4MdwFvXpaJQ8oOpxbKaM6V_uBmTrqpEahECBhXNKPNJmw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [kilo][fido-kilo][PATCH] python-fixtures: depends on python-pbr
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
X-List-Received-Date: Wed, 16 Sep 2015 20:05:54 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 15, 2015 at 7:07 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Fixes this build error:
> |   File ".../sysroots/x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
> |     raise DistutilsError(msg)
> | distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr')
> | ERROR: python setup.py build_ext execution failed.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> index fe1c8d1..f0cb453 100644
> --- a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
> @@ -21,4 +21,10 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --install-lib=${PYTHON_SITEPACKAGES_DIR} \
>      --install-data=${datadir}"
>
> -RDEPENDS_${PN} += "python-testtools"
> +DEPENDS += " \
> +       python-pbr \
> +       "
> +
> +RDEPENDS_${PN} += "python-testtools \
> +       python-pbr \
> +       "
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

