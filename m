Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2ED1E00CAC; Tue, 18 Dec 2018 05:00:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6070DE00CA1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2018 05:00:12 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id k19-v6so14096054lji.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2018 05:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gP5kIFlNKF8MzFBcDcStKGgGXyAN6aEKmpXtr3Wt5ew=;
	b=iENbFL0kwThOJKMl1Oo2XKTz5L/IM/lWh+IYptdz2L+0o/Pm+jpVIszZC/Lh+VTkgd
	q4G8K4PvviFSgo5BXA9RCO/BewSIm8FGbvjOgLwx1+Atcm/nk7BDsXLi2Tr6dyUEUWih
	Td7nNW9ZHZ1nhfSBFoJnCM6ACON1Bscbemfgd7dPU4F0P1KdKBNNQ91nG2yed/TDz4fs
	VB8wiNVQHxhG/A1hn2RVO2tOgErHKPlPnujV/RJ5tgRAutD7heMhAVD1DD1TgOrICHAp
	VG9mfTddNBOKClkCh/clg5VG72nmmJ9MW+Sy24TtFofuhqZsGVmEP33wirkmybIIPQ5o
	rFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gP5kIFlNKF8MzFBcDcStKGgGXyAN6aEKmpXtr3Wt5ew=;
	b=hbjMCJEzqcs/fb3S+3q0IcLoBt1Yoi0ySdHzWnOCh/hUqYNiqAAHw/y5ji4L1QlyvQ
	D2h4a+4GSr1QVmksPA42uOlTCfWjWMGX7v+lma6AjTYfn8l5neHYZGrhRturJOwCoN5p
	t0Mm6bmm3lDUsPRN+/bM7P0NsXld/5W7lLrawTdJqm8vEURKEHD4w+wJGOrGV4BCPb/l
	h48TZV+oC8vOGsgv6HZxk9CxSPaR/e26Ag5WqY8MUpv1zgtmmjUkIMs8478GfvQjC0EM
	S2FgAqlihXiQmAs2VNxISUZVMMy1JX/ouvd7sz+6/P2cwjrKPuGxcgmNpKP75objXIbn
	VfLw==
X-Gm-Message-State: AA+aEWZfRHVwFQZPlHtFIR2KGI1GImt7pgDhWvzI+857ioacXph+y/YG
	lM9bVIiBPH6jvKThRiIcElhAyugIyaEQOHPWw0U=
X-Google-Smtp-Source: AFSGD/Ux/wI5r0WY1MeWIQMfPUncaPjWI640+pN9IZQ0VTjD0p/9RP1vmusGh0Q0ryOwzS3HuYO+QChaw1FFKWUvzMo=
X-Received: by 2002:a2e:98c9:: with SMTP id s9-v6mr561261ljj.166.1545138011046;
	Tue, 18 Dec 2018 05:00:11 -0800 (PST)
MIME-Version: 1.0
References: <1545111076-243584-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1545111076-243584-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Dec 2018 07:59:59 -0500
Message-ID: <CADkTA4NzPvJj3B1xj0aZzSmG=dtTQBaKojEuTFbBQuiH8SRe_w@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>, 
	Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: Add new option to use short hostname for ovs-ctl script
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
X-List-Received-Date: Tue, 18 Dec 2018 13:00:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 18, 2018 at 12:31 AM Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
>
> [Backport two commits from openvswitch]

At this point in the release cycle, I'd rather not take backports, but
instead a full version bump of OVS instead.

Is there some reason why we can't go to a version that already
contains the patches ? Even if it on a master/unstable branch, that is
still ok at this point in the cycle.

Bruce

>
> Current ovs-ctl forces to set full hostname in external-ids. In
> some situation users may want to set short hostname. For example,
> in OpenStack - OVN integration, Neutron uses the host-id provided
> by Nova, which is usually short hostname, to set "requested-chassis"
> in OVN. The mismatch in hypervisor's external-ids:hostname setting
> causes OVN port binding failure. It can be overridden to short name
> but a openvswitch restart using ovs-ctl would again set it to full
> hostname. This patch ensures in such use cases --no-full-hostname
> can be specified to ovs-ctl to set short hostname instead.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...-ctl-Add-new-option-to-use-short-hostname.patch | 63 ++++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch_git.bb  |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch b/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch
> new file mode 100644
> index 0000000..b539310
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch
> @@ -0,0 +1,63 @@
> +From 48091ad4e2417df5494be1a61378785d3bae9733 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Mon, 17 Dec 2018 04:16:24 -0500
> +Subject: [PATCH] ovs-ctl: Add new option to use short hostname
> +
> +Current ovs-ctl forces to set full hostname in external-ids. In
> +some situation users may want to set short hostname. For example,
> +in OpenStack - OVN integration, Neutron uses the host-id provided
> +by Nova, which is usually short hostname, to set "requested-chassis"
> +in OVN. The mismatch in hypervisor's external-ids:hostname setting
> +causes OVN port binding failure. It can be overridden to short name
> +but a openvswitch restart using ovs-ctl would again set it to full
> +hostname. This patch ensures in such use cases --no-full-hostname
> +can be specified to ovs-ctl to set short hostname instead.
> +
> +Signed-off-by: Han Zhou <hzhou8@ebay.com>
> +Signed-off-by: Ben Pfaff <blp@ovn.org>
> +
> +Upstream-Status: Backport [298115b94] and [dd091e163].
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + utilities/ovs-ctl.in | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/utilities/ovs-ctl.in b/utilities/ovs-ctl.in
> +index 43c8f32..ca5e1dd 100755
> +--- a/utilities/ovs-ctl.in
> ++++ b/utilities/ovs-ctl.in
> +@@ -38,7 +38,12 @@ insert_mod_if_required () {
> + set_hostname () {
> +     # 'hostname -f' needs network connectivity to work.  So we should
> +     # call this only after ovs-vswitchd is running.
> +-    ovs_vsctl set Open_vSwitch . external-ids:hostname="$(hostname -f)"
> ++    if test X$FULL_HOSTNAME = Xyes; then
> ++        hn="$(hostname -f)" || hn="$(uname -n)"
> ++    else
> ++        hn="$(uname -n)"
> ++    fi
> ++    ovs_vsctl set Open_vSwitch . external-ids:hostname="$hn"
> + }
> +
> + set_system_ids () {
> +@@ -291,6 +296,8 @@ enable_protocol () {
> + set_defaults () {
> +     SYSTEM_ID=
> +
> ++    FULL_HOSTNAME=yes
> ++
> +     DELETE_BRIDGES=no
> +     DELETE_TRANSIENT_PORTS=no
> +
> +@@ -376,6 +383,7 @@ Less important options for "start", "restart" and "force-reload-kmod":
> +   --no-mlockall                  do not lock all of ovs-vswitchd into memory
> +   --ovsdb-server-priority=NICE   set ovsdb-server's niceness (default: $OVSDB_SERVER_PRIORITY)
> +   --ovs-vswitchd-priority=NICE   set ovs-vswitchd's niceness (default: $OVS_VSWITCHD_PRIORITY)
> ++  --no-full-hostname             set short hostname instead of full hostname
> +
> + Debugging options for "start", "restart" and "force-reload-kmod":
> +   --ovsdb-server-wrapper=WRAPPER
> +--
> +2.8.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index b8bbb3a..9be4a91 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> +           file://0001-ovs-ctl-Add-new-option-to-use-short-hostname.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> --
> 2.8.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

