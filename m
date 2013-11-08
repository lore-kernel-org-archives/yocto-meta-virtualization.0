Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71CE0E01830
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Nov 2013 05:23:53 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1Vem2G-0004PK-4A; Fri, 08 Nov 2013 13:23:40 +0000
Message-ID: <527CE5DE.7030407@twobit.us>
Date: Fri, 08 Nov 2013 08:23:42 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383706491-3555-1-git-send-email-flihp@twobit.us>
	<CADkTA4MAfcsVPH54igL_PSvh8U=Q_85bSQincGSQNb7OMHMPSQ@mail.gmail.com>
	<CABZSBQcXJ4mJTCAwwVoT9-oRoAOKsZYwxiPNxn1eOawpB-K5xA@mail.gmail.com>
In-Reply-To: <CABZSBQcXJ4mJTCAwwVoT9-oRoAOKsZYwxiPNxn1eOawpB-K5xA@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add getty to inittab for login on Xen serial console.
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
X-List-Received-Date: Fri, 08 Nov 2013 13:23:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/07/2013 11:07 PM, Chris Patterson wrote:
> Thanks, handy!

Similarly handy if you're building Xen guest VMs is throwing

USE_VT = "0"
SERIAL_CONSOLES = ""

into one of your conf files (I'm using a distro conf) to keep your
machine config from putting a physical serial device that your VM won't
have in the inittab. Messages about init sleeping for 30 seconds on
account of gettys restarting too quickly get old fast.

- Philip

> On Thu, Nov 7, 2013 at 3:32 PM, Bruce Ashfield <bruce.ashfield@gmail.com
> <mailto:bruce.ashfield@gmail.com>> wrote:
> 
>     On Tue, Nov 5, 2013 at 9:54 PM, Philip Tricca <flihp@twobit.us
>     <mailto:flihp@twobit.us>> wrote:
>     > It's not pretty but the mechanisms in sysvinit-inittab assume the
>     > console device name is tty*. The Xen console device doesn't meet
>     > this criteria.
> 
>     merged (with a minor tweak to the shortlog).
> 
>     Bruce
> 
>     >
>     > Signed-off-by: Philip Tricca <flihp@twobit.us
>     <mailto:flihp@twobit.us>>
>     > ---
>     >  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend |    7
>     +++++++
>     >  1 file changed, 7 insertions(+)
>     >  create mode 100644
>     recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>     >
>     > diff --git
>     a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>     b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>     > new file mode 100644
>     > index 0000000..2edbedf
>     > --- /dev/null
>     > +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
>     > @@ -0,0 +1,7 @@
>     > +do_install_append() {
>     > +       echo "${DISTRO_FEATURES}" | grep -q 'xen'
>     > +       if [ $? -eq 0 ]; then
>     > +               echo "" >> ${D}${sysconfdir}/inittab
>     > +               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >>
>     ${D}${sysconfdir}/inittab
>     > +       fi
>     > +}
>     > --
>     > 1.7.10.4
>     >
>     > _______________________________________________
>     > meta-virtualization mailing list
>     > meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
>     --
>     "Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end"
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 


