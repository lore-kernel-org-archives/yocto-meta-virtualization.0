Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CB01E014D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Apr 2013 06:11:58 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id r10so3208241lbi.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Apr 2013 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=e5pptMkOQPNqRqvmbQCZuNY/YTlbx7/NWy15nEDtHPM=;
	b=AJ6mIh+woXsVHRkXfcmSAyfwjPfZFEA3F3dmJzcpBOj9gnW8tmskpKs89+sOZ5/Shx
	B5cyUojqNpqviRxam9QUmFwCO84fWe4Skpcob2ZwFuiZuOJha2KaMdtnGYVlJabqrPre
	2EQjNTw/xTUTfw9tK6R9sqcc4APXiXPjq4EyLHuhTHDFyguKHoputpMqN4Zc6FbgL1Zc
	hjKuO8fTpSwp8ng9Lta+vnoLKmgcvz/POFhyqvC89JsU+I9wkgfPI8u4gvfPzHj3Cqr7
	5QQxSTEOd+DXPFr8VS5WUMPVWKyqgzNv09Qq+v4g5KvvwSzUphhLEz+1e3geO8gvyHPb
	sHHg==
MIME-Version: 1.0
X-Received: by 10.112.155.67 with SMTP id vu3mr15522102lbb.109.1366981917138; 
	Fri, 26 Apr 2013 06:11:57 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 26 Apr 2013 06:11:57 -0700 (PDT)
In-Reply-To: <1366907449-3706-1-git-send-email-jslater@windriver.com>
References: <1366907449-3706-1-git-send-email-jslater@windriver.com>
Date: Fri, 26 Apr 2013 09:11:57 -0400
Message-ID: <CADkTA4OykyXpQaPhq=MDOPbhCo71JpbgcMwaaz0t6=DEhsORQg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH] openvswitch: functionality sanity test
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
X-List-Received-Date: Fri, 26 Apr 2013 13:11:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 25, 2013 at 12:30 PM, Joe Slater <jslater@windriver.com> wrote:
> Instructions for creating a simple bridge that will take
> over eth0.  You cannot be executing out of an nfs-mounted
> filesystem while setting up the bridge.

Thanks Joe. This looks good. Will you resend the updated ovs version
bump as well ? If you reference this script/testing in it's commit log
we should be good to go.

Bruce

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  docs/vswitch_test.sh |   36 ++++++++++++++++++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100755 docs/vswitch_test.sh
>
> diff --git a/docs/vswitch_test.sh b/docs/vswitch_test.sh
> new file mode 100755
> index 0000000..63168e3
> --- /dev/null
> +++ b/docs/vswitch_test.sh
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +# runqemu defaults for the first "guest"
> +#
> +my_inet4="192.168.7.2"
> +my_gw="192.168.7.1"
> +
> +# create a bridge
> +#
> +ovs-vsctl add-br br-int
> +
> +# Add a physical interface to your virtual bridge for connectivity off box.
> +# If your rootfs is nfs mounted (on eth0), you will die after attaching it
> +# to the bridge.
> +#
> +ovs-vsctl add-port br-int eth0
> +
> +# Zero out your eth0 interface and slap it on the bridge interface.
> +#
> +ifconfig eth0 0
> +ifconfig br-int ${my_inet4} netmask 255.255.255.0
> +
> +# Change your default route.  If you don't do this, nothing will
> +# be reachable.
> +#
> +route add default gw ${my_gw} br-int
> +
> +(You can then check that the connection works.)
> +
> +# The bridge configuration is persistant, so if something goes wrong
> +# and you reboot, it will still be messed up.  Destroy the bridge,
> +# then add a route, or reboot.
> +#
> +ovs-vsctl del-br br-int
> +ifconfig eth0 ${my_inet4}
> +route add default gw ${my_gw} eth0
> --
> 1.7.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

