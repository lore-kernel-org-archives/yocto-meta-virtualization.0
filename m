Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A385E0072F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 08:33:04 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0TGX2t9001860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Jan 2013 08:33:02 -0800 (PST)
Received: from [128.224.158.249] (128.224.158.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 29 Jan 2013 08:33:00 -0800
Message-ID: <5107F9B9.10500@windriver.com>
Date: Wed, 30 Jan 2013 00:32:57 +0800
From: lei yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1359370883-2033-1-git-send-email-lei.yang@windriver.com>
	<CADkTA4N0LWxDXWSGnUzUQKgGWPEtZ0wyzNF4p9Jf68xTZ5uDWw@mail.gmail.com>
In-Reply-To: <CADkTA4N0LWxDXWSGnUzUQKgGWPEtZ0wyzNF4p9Jf68xTZ5uDWw@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Jan 2013 16:33:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2013 09:46 PM, Bruce Ashfield wrote:
>
>
> On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com 
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
>     This is becasue openvswitch isn't running,so we'd better start it
>     at the boot time.
>
>
> s/becasue/because/
>
> Can you elaborate on this a bit more as well. What you are actually 
> doing in the
> patch is adding to the RDEPENDS of openvswitch and it's the 
> dependencies that
> you are adding, that once installed are starting the switch at runtime 
> .. right ? The
> reason I'd like it clarified is that when I read your patch, I 
> expected to see an initscript
> update, or inherit rc.d, but found the RDEPENDS update instead.


because : those tow packages used rc.d. so we only need to install them

inherit autotools update-rc.d

INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"

INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"


I will send V2 tomorrow

LeI





>     Since openvswtich depends on openvswtich module,so auto load the
>     kernel module too.
>
>
>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
>     Tested-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
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
>
>
> This looks fine. I double checked that the vswitch kernel fragment 
> enables the module,
> so our autoload is fine.
>
> Bruce
>
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
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"
>
>
> On Mon, Jan 28, 2013 at 6:01 AM, <lei.yang@windriver.com 
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
>     This is becasue openvswitch isn't running,so we'd better start it
>     at the boot time.
>     Since openvswtich depends on openvswtich module,so auto load the
>     kernel module too.
>
>     Signed-off-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
>     Tested-by: Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>>
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
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


