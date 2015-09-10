Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB661E00DAC; Thu, 10 Sep 2015 11:46:36 -0700 (PDT)
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
	*      [209.85.160.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5697EE00DAA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:33 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so67312929ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WApdfDYRVO+0tWaNJDF5wOKwbsU0x/xZwWKbJ65L27Y=;
	b=RyK+sB6nIAcjM9lcEDVCUXHJ65S1IxyjtkjKznZRMGSQbqeuox27/VTfEOUxuOaLh9
	IHXV5ydYsflYqI8CYoBsUkQjlnyPYkTy5XL29HJKxz6VHSynH7WK3lkaNZwr/wH9WzWP
	SRKU/xC9gU675NV6OTjUEA+l61mdXW5osaRVD/KANK93TEAsDOZh+FR/vUVMFnOT7OS9
	C/afwlM1Ub6pRiYXcvGETXLAUzpgceL2+GVRpq/OTOVHQpD41RcuaRZYEgV4yFq4JUUu
	iqAbvlMm9vW3KK77J2pfu2SOW57l+jRLRqty5oAEdDRYJlSCa46vad88oMIT4VoH4d1F
	XlHg==
MIME-Version: 1.0
X-Received: by 10.129.73.203 with SMTP id w194mr29392140ywa.16.1441910793381; 
	Thu, 10 Sep 2015 11:46:33 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 10 Sep 2015 11:46:33 -0700 (PDT)
In-Reply-To: <1441813927-40182-1-git-send-email-josep.puigdemont@enea.com>
References: <1441813927-40182-1-git-send-email-josep.puigdemont@enea.com>
Date: Thu, 10 Sep 2015 14:46:33 -0400
Message-ID: <CADkTA4NRoPdT5H7U1q8r1RU7pC85bH=pSn-=ktQH9uTA7MxP2g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [fido-kilo][PATCH] python-cliff: account for dependency on python-pbr
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
X-List-Received-Date: Thu, 10 Sep 2015 18:46:37 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 9, 2015 at 11:52 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> This fixes this build error:
> |   File ".../x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
> |     raise DistutilsError(msg)
> | distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr')
> | ERROR: python setup.py build_ext execution failed.
> | WARNING: exit code 1 from a shell command.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> index 7a6bb83..e107a28 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> @@ -16,8 +16,14 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
>
> +DEPENDS += " \
> +       python-pbr \
> +       "
> +
>  RDEPENDS_${PN} += "python-prettytable \
>              python-cmd2 \
> -            python-pyparsing"
> +            python-pyparsing \
> +            python-pbr \
> +            "
>
>  CLEANBROKEN = "1"
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

