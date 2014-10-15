Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2DE1FE00799; Wed, 15 Oct 2014 11:14:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 914F1E006EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Oct 2014 11:14:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9FIDxwk017915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Oct 2014 11:14:01 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 15 Oct 2014 11:13:58 -0700
Message-ID: <543EB95A.4000105@windriver.com>
Date: Wed, 15 Oct 2014 14:13:46 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Yang Shi <yang.shi@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1413344463-30106-1-git-send-email-yang.shi@windriver.com>
In-Reply-To: <1413344463-30106-1-git-send-email-yang.shi@windriver.com>
Subject: Re: [PATCH] lxc: Tweak lxc template script for systemd/sysvinit
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
X-List-Received-Date: Wed, 15 Oct 2014 18:14:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-10-14 11:41 PM, Yang Shi wrote:
> Tweak the script to make it work for both systemd and sysvinit.
>
> Add "-i <init_method>" parameter. If sysvinit guest is used, "-i sysvinit" need
> to be passed. The default init is systemd.
>
> The below systemd specific changes are added:
> Add "lxc.autodev=1" since LXC will create its own device tree.
> Add "lxc.kmsg=0" to prevent lxc symlinks /dev/kmsg to /dev/console, this leads
> to journald running 100% cpu usage all the time.
> Remove unnecessary mount entry in fstab.

This is definitely good information, and worth the broadcast. I was
asking for any systemd changes that may be floating around, but since
we are patching code that isn't already part of meta-virt, we'll let
this sit and see if any of the dependencies are also available to merge.

Cheers,

Bruce

>
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>   templates/lxc-wrlinux.in | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/templates/lxc-wrlinux.in b/templates/lxc-wrlinux.in
> index 1ef512b..7775cf2 100644
> --- a/templates/lxc-wrlinux.in
> +++ b/templates/lxc-wrlinux.in
> @@ -30,8 +30,10 @@ default_profile=default
>
>   configure_wrlinux()
>   {
> -    # Tweak initscripts
> -    sed -i 's/^\(si::sysinit:\/etc\/init.d\/rcS\)/# \1/' ${rootfs_path}/etc/inittab
> +    if [ "${init_method}" == "sysvinit" ]; then
> +        # Tweak initscripts
> +        sed -i 's/^\(si::sysinit:\/etc\/init.d\/rcS\)/# \1/' ${rootfs_path}/etc/inittab
> +    fi
>
>       # Touch file for fastboot
>       dev_path="${rootfs_path}/dev"
> @@ -78,9 +80,11 @@ copy_configuration()
>
>       mkdir -p $config_path
>       grep -q "^lxc.rootfs" $config_path/config 2>/dev/null || echo "lxc.rootfs = $rootfs_path" >> $config_path/config
> +
> +    if [ "${init_method}" == "sysvinit" ]; then
>       cat <<EOF >> $config_path/config
>   lxc.utsname = $name
> -lxc.tty = 6
> +lxc.tty = 6
>   lxc.pts = 1024
>   lxc.mount = $config_path/fstab
>   EOF
> @@ -91,6 +95,21 @@ none            $rootfs_path/sys          sysfs   defaults  0 0
>   none            $rootfs_path/dev/pts      devpts  defaults  0 0
>   none            $rootfs_path/dev/shm      tmpfs   defaults  0 0
>   EOF
> +    # systemd
> +    else
> +    cat <<EOF >> $config_path/config
> +lxc.utsname = $name
> +lxc.autodev=1
> +lxc.kmsg=0
> +lxc.tty = 6
> +lxc.pts = 1024
> +lxc.mount = $config_path/fstab
> +EOF
> +
> +    cat <<EOF > $config_path/fstab
> +none            $rootfs_path/sys          sysfs   defaults  0 0
> +EOF
> +    fi
>
>       if [ $? -ne 0 ]; then
>           echo "Failed to add configuration"
> @@ -110,17 +129,18 @@ usage()
>       cat <<EOF
>   usage:
>       $1 -n|--name=<container_name>
> -        [-p|--path=<path>] [-h|--help]
> +        [-p|--path=<path>] [-i|--init=<init_method>] [-h|--help]
>   Mandatory args:
>     -n,--name         container name, used to as an identifier for that container from now on
>   Optional args:
>     -p,--path         path to where the container rootfs will be created, defaults to @LXCPATH@. The container config will go under @LXCPATH@ in that case
> +  -i,--init         init method used by system, systemd or sysvinit
>     -h,--help         print this help
>   EOF
>       return 0
>   }
>
> -options=$(getopt -o hp:n: -l help,path:,name: -- "$@")
> +options=$(getopt -o hp:n:i: -l help,path:,name:,init: -- "$@")
>   if [ $? -ne 0 ]; then
>       usage $(basename $0)
>       exit 1
> @@ -133,6 +153,7 @@ do
>           -h|--help)      usage $0 && exit 0;;
>           -p|--path)      path=$2; shift 2;;
>           -n|--name)      name=$2; shift 2;;
> +        -i|--init)      init_method=$2; shift 2;;
>           --)             shift 1; break ;;
>           *)              break ;;
>       esac
>


