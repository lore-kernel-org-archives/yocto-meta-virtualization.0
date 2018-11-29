Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16E70E00C72; Thu, 29 Nov 2018 09:08:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67252E00901
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:08:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wATH7ilg018826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Nov 2018 09:07:54 -0800
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 09:07:33 -0800
To: Ting Yu <tyu@cisco.com>, <meta-virtualization@yoctoproject.org>
References: <20181127191454.2581-1-tyu@cisco.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b70eecb0-74ec-b5e5-90f9-983ea3dd32be@windriver.com>
Date: Thu, 29 Nov 2018 12:07:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181127191454.2581-1-tyu@cisco.com>
Subject: Re: [PATCH] docker: fix broken init script
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
X-List-Received-Date: Thu, 29 Nov 2018 17:08:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I tried to apply this on master, and it fails. Which branch is this 
against ?

We should do two patches in a scenario like this: 1) fix it on master
2) request a backport, or do a version for other branches.

Since we don't only want fixes in already released branches.

On 11/27/18 2:14 PM, Ting Yu wrote:
> From: Chin Huat Ang <chin.huat.ang@intel.com>
> 
> Fix numerous docker.init issues such as missing runtime dependency
> util-linux-unshare, incomplete handling of start/stop etc. operations
> and minor typos.
> 
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Since we'll need a v2, I can offer some tips here.

Drop my Signed-off-by:, I'll add it when merging the change. And
add your Signed-off-by: since you are sending the change on behalf
of the author.

Cheers,

Bruce

> ---
>   recipes-containers/docker/docker-ce_git.bb  |  2 +-
>   recipes-containers/docker/docker_git.bb     |  2 +-
>   recipes-containers/docker/files/docker.init | 12 ++++++++----
>   3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 7a41850..caf6d70 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -62,7 +62,7 @@ DEPENDS = " \
>   PACKAGES =+ "${PN}-contrib"
>   
>   DEPENDS_append_class-target = " lvm2"
> -RDEPENDS_${PN} = "util-linux iptables \
> +RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                    "
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index f63cee1..7957808 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -67,7 +67,7 @@ PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>   PACKAGES =+ "${PN}-contrib"
>   
>   DEPENDS_append_class-target = " lvm2"
> -RDEPENDS_${PN} = "util-linux iptables \
> +RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                    "
> diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
> index 2e8eb9e..0aea8d0 100644
> --- a/recipes-containers/docker/files/docker.init
> +++ b/recipes-containers/docker/files/docker.init
> @@ -22,7 +22,7 @@
>   # Source function library.
>   . /etc/init.d/functions
>   
> -prog="docker"
> +prog="dockerd"
>   unshare=/usr/bin/unshare
>   exec="/usr/bin/$prog"
>   pidfile="/var/run/$prog.pid"
> @@ -40,7 +40,7 @@ start() {
>       if ! [ -f $pidfile ]; then
>           printf "Starting $prog:\t"
>           echo -e "\n$(date)\n" >> $logfile
> -        "$unshare" -m -- $exec daemon $other_args &>> $logfile &
> +        "$unshare" -m -- $exec $other_args &>> $logfile &
>           pid=$!
>           touch $lockfile
>           # wait up to 10 seconds for the pidfile to exist.  see
> @@ -83,7 +83,7 @@ force_reload() {
>   }
>   
>   rh_status() {
> -    status -p $pidfile $prog
> +    status $prog
>   }
>   
>   rh_status_q() {
> @@ -99,24 +99,28 @@ check_for_cleanup() {
>   
>   case "$1" in
>       start)
> +        rh_status_q && exit 0
>           $1
>           ;;
>       stop)
> +        rh_status_q || exit 0
>           $1
>           ;;
>       restart)
>           $1
>           ;;
>       reload)
> +        rh_status_q || exit 7
>           $1
>           ;;
>       force-reload)
>           force_reload
>           ;;
>       status)
> -        status
> +        rh_status
>           ;;
>       condrestart|try-restart)
> +        rh_status_q || exit 0
>           restart
>           ;;
>       *)
> 


