Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DDF3E00515
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Jan 2013 19:54:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r113snOo005563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Jan 2013 19:54:49 -0800 (PST)
Received: from [128.224.158.249] (128.224.158.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 31 Jan 2013 19:54:47 -0800
Message-ID: <510B3C84.5060009@windriver.com>
Date: Fri, 1 Feb 2013 11:54:44 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1359616727-15082-1-git-send-email-lei.yang@windriver.com>
	<CADkTA4M6MPUeC6XfHnWOgbYEbC3tiWauf7NyyZm0UPq05SjD9w@mail.gmail.com>
In-Reply-To: <CADkTA4M6MPUeC6XfHnWOgbYEbC3tiWauf7NyyZm0UPq05SjD9w@mail.gmail.com>
X-Originating-IP: [128.224.158.249]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswtich: start openvswitch at the boot time
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
X-List-Received-Date: Fri, 01 Feb 2013 03:54:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 09:39 PM, Bruce Ashfield wrote:
>
>
>
> On Thu, Jan 31, 2013 at 2:18 AM, <lei.yang@windriver.com 
> <mailto:lei.yang@windriver.com>> wrote:
>
>     From: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
>
>     When I define the bridge, I get below error
>
>     root@intel_5500_server:~# ovs-vsctl add-br ovsbr0
>     Jan 25 17:34:07|00002|stream_unix|ERR|/tmp/stream-unix.1487.0:
>     connection to /var/run/openvswitch/db.sock
>     failed: No such file or directory
>     ........
>     ........
>
>     This is because openvswitch damon isn't running,so we'd better
>     start it at the boot time.
>     The split-pacakage ${PN}-switch ${PN}-controller provide us to
>     start nessary damon with update-rc.d
>
>
> s/pacakage/package/
> s/nessary/necessary/
> s/damon/daemon/
>
>     so we add them to the RDEPENDS.
>
>     Since openvswtich depends on openvswtich kernel module,so auto
>     load the kernel module too.
>
>
> s/openvswtich/openvswitch/
>
>
>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
>     Tested-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
>
>
> We can drop the Tested-by: since it is your patch :)
>
> I can make the changes below if you agree with them, and save us 
> another revision
> of the patch.
>

Agree, I don't trust "set spell" again in vim :-( , it doesn't help me 
for this spelling error

Lei



> Cheers,
>
> Bruce
>
>     ---
>      recipes-kernel/linux/linux-yocto_3.4.bbappend      |    2 +-
>      .../openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>               |    2 +-
>      2 files changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     index 5b163ff..918302a 100644
>     --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
>     @@ -5,4 +5,4 @@ SRC_URI += "file://xt-checksum.scc \
>                 file://vswitch.scc \
>                 file://lxc.scc \
>                 "
>     -
>     +module_autoload_openvswitch = "openvswitch"
>     diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>
>     b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>
>     index 88f0114..6764073 100644
>     --- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>
>     +++ b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
>     <http://openvswitch_1.4.3.bb>
>     @@ -7,7 +7,7 @@ LICENSE = "Apache-2"
>      DEPENDS += "bridge-utils openssl python perl"
>
>      RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
>     -              python perl perl-module-strict"
>     +              python perl perl-module-strict ${PN}-switch
>     ${PN}-controller"
>      RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
>      RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>      RDEPENDS_${PN}-pki = "${PN}"
>     --
>     1.7.1
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


