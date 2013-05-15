Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECEE6E01486
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 05:57:31 -0700 (PDT)
Received: by mail-lb0-f182.google.com with SMTP id r11so1825501lbv.27
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=zLNOK8sTVDFKeEFwmkGT2VA5C8HwyYsKAEKB3XakK60=;
	b=jxpigDZToR7SzKPsH9wyKRaulj3/vqawN3wJMw3lHTbCo7iJXBTd7woMYjJ3jIn+PH
	QFsIe8LZKlQZXjoeRkjEqAxf9/+cbPMZth7tZWad5xWRf2pk6RswV1W3I9nI5ewD1uf0
	6sNdy81t0kZExNkVy9OEByU4SohVX/5W1ncgy/PGuPiH1YRdNdNck8Mf9AIj9pA0k9p0
	hXVPAemjpkNZU5ru3g8vJj0gSLtFcPdkh+PRFUBYtdzJhw86ssptVku/CB8KQ+O75IEh
	QSNNc/GthrP9erS/LWjP555mPIgyEizk7xJFp9kdrHJ0FcdgyVBRjovUgifVvS2CLJLb
	lN4w==
MIME-Version: 1.0
X-Received: by 10.112.158.71 with SMTP id ws7mr13411344lbb.49.1368622650276;
	Wed, 15 May 2013 05:57:30 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 05:57:30 -0700 (PDT)
In-Reply-To: <1368606517-4873-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1368606517-4873-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 15 May 2013 08:57:30 -0400
Message-ID: <CADkTA4PbHgvx6nUD9Z3qpSMGgPgygVnhtQzPUJgH_770-oeA3g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] dmidecode: remove
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
X-List-Received-Date: Wed, 15 May 2013 12:57:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 4:28 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> A newer version is now in OE-Core.

Grabbed and pulled into my queue. I'll push the changes shortly.

Bruce

>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  recipes-extended/dmidecode/dmidecode_2.11.bb | 26 --------------------------
>  1 file changed, 26 deletions(-)
>  delete mode 100644 recipes-extended/dmidecode/dmidecode_2.11.bb
>
> diff --git a/recipes-extended/dmidecode/dmidecode_2.11.bb b/recipes-extended/dmidecode/dmidecode_2.11.bb
> deleted file mode 100644
> index 65496ae..0000000
> --- a/recipes-extended/dmidecode/dmidecode_2.11.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
> -HOMEPAGE = "http://www.nongnu.org/dmidecode/"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
> -SECTION = "console/tools"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${PN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "9fddbbc3e330bee5950b8b5d424a57cb"
> -SRC_URI[sha256sum] = "d99ee210ecbd6caff2cf6d95dec6d88818c16cec1a08ed0963fd8702f6af8b59"
> -
> -EXTRA_OEMAKE =+ "prefix=${prefix}  \
> -                 includedir=${includedir} \
> -                 libdir=${libdir} \
> -                 sbindir=${sbindir} \
> -                 DESTDIR=${D} \
> -                 'CC=${CC}' \
> -                 'CFLAGS=${CFLAGS}' \
> -                 "
> -
> -do_install() {
> -    oe_runmake install
> -    install -d ${D}${sbindir}
> -}
> --
> 1.8.1.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

