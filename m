Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4F7C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:54:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.26236.1677686083610656843
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 07:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ok0jLL3V;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: simonkbaby@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso1537775pju.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XRzX1SO+e79F0Ct33DnKz3Ds1CYqygjpfj5ZMHmb+8=;
        b=Ok0jLL3Vy3bUzJKsTuEzKi1gAFLdIQkDAtcSdNKzTcRSXn/gO5j1El3Se5hLsVdydx
         6MuLBWdlPAiGeWNKRBGP+cq+OiWGs9UVM3x1Dof61BT/aNa/8Cn3BJ0UleDH2O3kF3m2
         OTCfYM2BYFCpZ3EWXcv7TOnST7zMM5Oa57e00WZBDlHAV3ipUR5MV7myyGC6ai9O+jrB
         7hz79uZrNr2XUFY05+WpOM/wA4AHxxlx0CyNRuOh4ve6C74XCO8grPKvU/rpA9tHA/k5
         yr46U/+E0PbUzf+mWkzy1Ke9QYdtGAD3dXEx47RcNJ90gZXIhXZuXo0JWVv0/jyF+l7u
         +4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XRzX1SO+e79F0Ct33DnKz3Ds1CYqygjpfj5ZMHmb+8=;
        b=XhamMsM1isVkpm9V/ciSjdoeAEv7CQeums449jXOevsh2Fu8eq/KTcZBqpvomBZy92
         k9tUV+fUfPqnzIcPTqaBS9ZA+zimjtymuqO4HKgYIUMHgbYEfl9I0HNEmkYfLEIosw7R
         KBathMVRkP9u2eKh0G+Pp5W8zWm18MnYDedWY4KFLvA8PqE7l4GoO79c4QqNGB2Rajvt
         TNzZ1bTWZeQ9ogKAHoZ3q8TjwaB3zSscK7OVBqlsg84y3ZecajpZBW8uprg6lGjz4HiX
         zrI7wFF3zM60XRdaX5QoAaBZCm1EQjh7Afy6X9JXY/dE7NaZkP0LNX+PZi8PdH2EGo0o
         uwwA==
X-Gm-Message-State: AO0yUKUPl1vfdq6LJfpjoU1hJYueoed6d+4yppsySOTI+zSSF2dXuDra
	eppEUnAzx9T8R3Y2ddXRCP3Z3N9e9iUCsYBF5tJEjPv+Z1I=
X-Google-Smtp-Source: AK7set8j9Luo9TzbGSfnEC9v0V/4OS8/0WOJZFyKEYUr7OJLDHdItoBKD6q/sE5RMA6RgR4NvG9aLo/hnkCXvSM1EQs=
X-Received: by 2002:a17:903:4285:b0:19c:da35:6699 with SMTP id
 ju5-20020a170903428500b0019cda356699mr2416287plb.7.1677686082064; Wed, 01 Mar
 2023 07:54:42 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
 <17473B860936B482.18951@lists.yoctoproject.org> <CAEFUPH26tNiuYHEnWuszkPjizNSQo9kV08zNMuE8Bf1+vm-=zA@mail.gmail.com>
 <CADkTA4OB46d04gTpz4bEon71izVVT90ZwKbN0gFKMhUKKo3wQA@mail.gmail.com>
In-Reply-To: <CADkTA4OB46d04gTpz4bEon71izVVT90ZwKbN0gFKMhUKKo3wQA@mail.gmail.com>
From: SIMON BABY <simonkbaby@gmail.com>
Date: Wed, 1 Mar 2023 07:54:31 -0800
Message-ID: <CAEFUPH3VW4f-8fUKgEoJB5HYqgT=o+Yg70Sk_UtrE+frJQYpnQ@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f756b605f5d8bafb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 15:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7921

--000000000000f756b605f5d8bafb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

Of course, you won't always see the daemon running on startup, as
there are socket and other systemd triggers that will launch the
daemon when required (and it will continue to run after that).
Simon> The daemon is not starting by default after every boot. I need to
type any docker command and wait for 2-3 minutes to get docker run.
If you add docker-ce-contrib (or docker-moby-contrib, depending on
what flavour you are building), one of the docker supplied scripts
will be installed to the target. You can use that to check the running
kernel configuration and look for issues.
Simon> yes I run the script check-config.sh and below is the o/p



Generally Necessary:
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]
- CONFIG_NAMESPACES: enabled
- CONFIG_NET_NS: enabled
- CONFIG_PID_NS: enabled
- CONFIG_IPC_NS: enabled
- CONFIG_UTS_NS: enabled
- CONFIG_CGROUPS: enabled
- CONFIG_CGROUP_CPUACCT: enabled
- CONFIG_CGROUP_DEVICE: enabled
- CONFIG_CGROUP_FREEZER: enabled
- CONFIG_CGROUP_SCHED: enabled
- CONFIG_CPUSETS: enabled
- CONFIG_MEMCG: missing
- CONFIG_KEYS: enabled
- CONFIG_VETH: enabled (as module)
- CONFIG_BRIDGE: enabled
- CONFIG_BRIDGE_NETFILTER: enabled (as module)
- CONFIG_IP_NF_FILTER: enabled (as module)
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
- CONFIG_NETFILTER_XT_MARK: enabled (as module)
- CONFIG_IP_NF_NAT: enabled
- CONFIG_NF_NAT: enabled
- CONFIG_POSIX_MQUEUE: enabled
- CONFIG_CGROUP_BPF: enabled

Optional Features:
- CONFIG_USER_NS: enabled
- CONFIG_SECCOMP: enabled
- CONFIG_SECCOMP_FILTER: enabled
- CONFIG_CGROUP_PIDS: enabled
- CONFIG_MEMCG_SWAP: missing
    (cgroup swap accounting is currently enabled)
- CONFIG_BLK_CGROUP: enabled
- CONFIG_BLK_DEV_THROTTLING: enabled
- CONFIG_CGROUP_PERF: enabled
- CONFIG_CGROUP_HUGETLB: enabled
- CONFIG_NET_CLS_CGROUP: enabled (as module)
- CONFIG_CGROUP_NET_PRIO: enabled
- CONFIG_CFS_BANDWIDTH: enabled
- CONFIG_FAIR_GROUP_SCHED: enabled
- CONFIG_RT_GROUP_SCHED: enabled
- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
- CONFIG_IP_VS: enabled (as module)
- CONFIG_IP_VS_NFCT: enabled
- CONFIG_IP_VS_PROTO_TCP: enabled
- CONFIG_IP_VS_PROTO_UDP: enabled
- CONFIG_IP_VS_RR: enabled (as module)
- CONFIG_SECURITY_SELINUX: enabled
- CONFIG_SECURITY_APPARMOR: enabled
- CONFIG_EXT3_FS: enabled
- CONFIG_EXT3_FS_XATTR: missing
- CONFIG_EXT3_FS_POSIX_ACL: enabled
- CONFIG_EXT3_FS_SECURITY: enabled
    (enable these ext3 configs if you are using ext3 as backing filesystem)
- CONFIG_EXT4_FS: enabled
- CONFIG_EXT4_FS_POSIX_ACL: enabled
- CONFIG_EXT4_FS_SECURITY: enabled
- Network Drivers:
  - "overlay":
    - CONFIG_VXLAN: enabled (as module)
    - CONFIG_BRIDGE_VLAN_FILTERING: enabled
      Optional (for encrypted networks):
      - CONFIG_CRYPTO: enabled
      - CONFIG_CRYPTO_AEAD: enabled
      - CONFIG_CRYPTO_GCM: enabled
      - CONFIG_CRYPTO_SEQIV: enabled
      - CONFIG_CRYPTO_GHASH: enabled
      - CONFIG_XFRM: enabled
      - CONFIG_XFRM_USER: enabled
      - CONFIG_XFRM_ALGO: enabled
      - CONFIG_INET_ESP: enabled
  - "ipvlan":
    - CONFIG_IPVLAN: enabled (as module)
  - "macvlan":
    - CONFIG_MACVLAN: enabled (as module)
    - CONFIG_DUMMY: enabled (as module)
  - "ftp,tftp client in container":
    - CONFIG_NF_NAT_FTP: enabled (as module)
    - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
    - CONFIG_NF_NAT_TFTP: enabled (as module)
    - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
- Storage Drivers:
  - "aufs":
    - CONFIG_AUFS_FS: missing
  - "btrfs":
    - CONFIG_BTRFS_FS: enabled (as module)
    - CONFIG_BTRFS_FS_POSIX_ACL: enabled
  - "devicemapper":
    - CONFIG_BLK_DEV_DM: enabled (as module)
    - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
  - "overlay":
    - CONFIG_OVERLAY_FS: enabled (as module)
  - "zfs":
    - /dev/zfs: missing
    - zfs command: missing
    - zpool command: missing

You'll find that script at: /usr/share/docker/check-config.sh

On Mon, Feb 27, 2023 at 6:26=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Sun, Feb 26, 2023 at 1:42 PM SIMON BABY <simonkbaby@gmail.com> wrote:
> >
> > Hi Bruce,
> > I have enabled some of the kernel flags. I am able to run the docker ru=
n
> command. But I see some logs when I run  the command even though it is
> executed. I also observed that docker daemon is not starting by default
> after every reboot. Do we have any specific fix for this?
> >
>
> There's no specific fix for that, because it isn't broken in anything
> that I've seen. docker starts fine on boot in all of my test cases.
>
> Of course, you won't always see the daemon running on startup, as
> there are socket and other systemd triggers that will launch the
> daemon when required (and it will continue to run after that).
>
> >
> > root@imx8mpevk:~# docker run hello-world
> > [  271.841466] docker0: port 1(vethd66b82d) entered blocking state
> > [  271.847462] docker0: port 1(vethd66b82d) entered disabled state
> > [  271.853592] device vethd66b82d entered promiscuous mode
> > [  271.858934] audit: type=3D1700 audit(1677436586.264:37):
> dev=3Dvethd66b82d prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=
=3D0
> ses=3D4294967295
> > [  271.871031] audit: type=3D1300 audit(1677436586.264:37): arch=3Dc000=
00b7
> syscall=3D206 success=3Dyes exit=3D40 a0=3Df a1=3D4000f54c90 a2=3D28 a3=
=3D0 items=3D0
> ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fs=
uid=3D0 egid=3D0
> sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"dockerd"
> exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
> > [  271.898659] audit: type=3D1327 audit(1677436586.264:37):
> proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
> > [  272.315534] eth0: renamed from veth95a7c15
> > [  272.326397] IPv6: ADDRCONF(NETDEV_CHANGE): vethd66b82d: link becomes
> ready
> > [  272.333388] docker0: port 1(vethd66b82d) entered blocking state
> > [  272.339340] docker0: port 1(vethd66b82d) entered forwarding state
> >
> > Hello from Docker!
> > This message shows that your installation appears to be working
> correctly.
> >
> > To generate this message, Docker took the following steps:
> >  1. The Docker client contacted the Docker daemon.
> >  2. The Docker daemon pulled the "hello-world" image from the Docker Hu=
b.
> >     (arm64v8)
> >  3. The Docker daemon created a new container from that image which run=
s
> the
> >     executable that produces the output you are currently reading.
> >  4. The Docker daemon streamed that output to the Docker client, which
> sent it
> >     to your terminal.
> >
> > To try something more ambitious, you can run an Ubuntu container with:
> >  $ docker run -it ubuntu bash
> >
> > Share images, automate workflows, and more with a free Docker ID:
> >  https://hub.docker.com/
> >
> > For more examples and ideas, visit:
> >  https://docs.docker.com/get-started/
> >
> > [  272.466210] docker0: port 1(vethd66b82d) entered disabled state
> > [  272.472523] veth95a7c15: renamed from eth0
> > [  272.505514] docker0: port 1(vethd66b82d) entered disabled state
> > [  272.513799] device vethd66b82d left promiscuous mode
> > [  272.518809] docker0: port 1(vethd66b82d) entered disabled state
> > [  272.518828] audit: type=3D1700 audit(1677436586.928:38):
> dev=3Dvethd66b82d prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=
=3D0
> ses=3D4294967295
> > [  272.550854] audit: type=3D1300 audit(1677436586.928:38): arch=3Dc000=
00b7
> syscall=3D206 success=3Dyes exit=3D32 a0=3Df a1=3D400014dfe0 a2=3D20 a3=
=3D0 items=3D0
> ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fs=
uid=3D0 egid=3D0
> sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"dockerd"
> exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
> > [  272.578481] audit: type=3D1327 audit(1677436586.928:38):
> proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
> >
> >
> > I have compared all the kernel configuration between my local ubuntu
> linux and the imx8 I am running. Below are all the kernel configuration s=
et
> on my target for the docker to run (as per nxp manual)
> >
>
> If you add docker-ce-contrib (or docker-moby-contrib, depending on
> what flavour you are building), one of the docker supplied scripts
> will be installed to the target. You can use that to check the running
> kernel configuration and look for issues.
>
> You'll find that script at: /usr/share/docker/check-config.sh
>
> Bruce
>
> >
> >
> > root@imx8mpevk:~# sh kernel.sh
> > info: reading kernel config from /proc/config.gz ...
> >
> > Generally Necessary:
> > - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> > - CONFIG_NAMESPACES: enabled
> > - CONFIG_NET_NS: enabled
> > - CONFIG_PID_NS: enabled
> > - CONFIG_IPC_NS: enabled
> > - CONFIG_UTS_NS: enabled
> > - CONFIG_CGROUPS: enabled
> > - CONFIG_CGROUP_CPUACCT: enabled
> > - CONFIG_CGROUP_DEVICE: enabled
> > - CONFIG_CGROUP_FREEZER: enabled
> > - CONFIG_CGROUP_SCHED: enabled
> > - CONFIG_CPUSETS: enabled
> > - CONFIG_MEMCG: enabled
> > - CONFIG_KEYS: enabled
> > - CONFIG_VETH: enabled (as module)
> > - CONFIG_BRIDGE: enabled
> > - CONFIG_BRIDGE_NETFILTER: enabled (as module)
> > - CONFIG_IP_NF_FILTER: enabled (as module)
> > - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
> > - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
> > - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> > - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
> > - CONFIG_NETFILTER_XT_MARK: enabled (as module)
> > - CONFIG_IP_NF_NAT: enabled
> > - CONFIG_NF_NAT: enabled
> > - CONFIG_POSIX_MQUEUE: enabled
> > - CONFIG_CGROUP_BPF: missing
> >
> > Optional Features:
> > - CONFIG_USER_NS: enabled
> > - CONFIG_SECCOMP: enabled
> > - CONFIG_SECCOMP_FILTER: enabled
> > - CONFIG_CGROUP_PIDS: enabled
> > - CONFIG_MEMCG_SWAP: enabled
> >     (cgroup swap accounting is currently enabled)
> > - CONFIG_BLK_CGROUP: enabled
> > - CONFIG_BLK_DEV_THROTTLING: enabled
> > - CONFIG_CGROUP_PERF: enabled
> > - CONFIG_CGROUP_HUGETLB: enabled
> > - CONFIG_NET_CLS_CGROUP: enabled (as module)
> > - CONFIG_CGROUP_NET_PRIO: enabled
> > - CONFIG_CFS_BANDWIDTH: enabled
> > - CONFIG_FAIR_GROUP_SCHED: enabled
> > - CONFIG_RT_GROUP_SCHED: missing
> > - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
> > - CONFIG_IP_VS: enabled (as module)
> > - CONFIG_IP_VS_NFCT: enabled
> > - CONFIG_IP_VS_PROTO_TCP: enabled
> > - CONFIG_IP_VS_PROTO_UDP: enabled
> > - CONFIG_IP_VS_RR: enabled (as module)
> > - CONFIG_SECURITY_SELINUX: enabled
> > - CONFIG_SECURITY_APPARMOR: enabled
> > - CONFIG_EXT3_FS: enabled
> > - CONFIG_EXT3_FS_XATTR: missing
> > - CONFIG_EXT3_FS_POSIX_ACL: missing
> > - CONFIG_EXT3_FS_SECURITY: missing
> >     (enable these ext3 configs if you are using ext3 as backing
> filesystem)
> > - CONFIG_EXT4_FS: enabled
> > - CONFIG_EXT4_FS_POSIX_ACL: enabled
> > - CONFIG_EXT4_FS_SECURITY: enabled
> > - Network Drivers:
> >   - "overlay":
> >     - CONFIG_VXLAN: enabled (as module)
> >     - CONFIG_BRIDGE_VLAN_FILTERING: enabled
> >       Optional (for encrypted networks):
> >       - CONFIG_CRYPTO: enabled
> >       - CONFIG_CRYPTO_AEAD: enabled
> >       - CONFIG_CRYPTO_GCM: enabled
> >       - CONFIG_CRYPTO_SEQIV: missing
> >       - CONFIG_CRYPTO_GHASH: enabled
> >       - CONFIG_XFRM: missing
> >       - CONFIG_XFRM_USER: missing
> >       - CONFIG_XFRM_ALGO: missing
> >       - CONFIG_INET_ESP: missing
> >   - "ipvlan":
> >     - CONFIG_IPVLAN: enabled (as module)
> >   - "macvlan":
> >     - CONFIG_MACVLAN: enabled (as module)
> >     - CONFIG_DUMMY: enabled (as module)
> >   - "ftp,tftp client in container":
> >     - CONFIG_NF_NAT_FTP: enabled (as module)
> >     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
> >     - CONFIG_NF_NAT_TFTP: enabled (as module)
> >     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> > - Storage Drivers:
> >   - "aufs":
> >     - CONFIG_AUFS_FS: missing
> >   - "btrfs":
> >     - CONFIG_BTRFS_FS: enabled (as module)
> >     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
> >   - "devicemapper":
> >     - CONFIG_BLK_DEV_DM: enabled (as module)
> >     - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
> >   - "overlay":
> >     - CONFIG_OVERLAY_FS: enabled (as module)
> >   - "zfs":
> >     - /dev/zfs: missing
> >     - zfs command: missing
> >     - zpool command: missing
> >
> >
> > Regards
> > Simon
> >
> > On Sat, Feb 25, 2023 at 5:27=E2=80=AFPM SIMON BABY via lists.yoctoproje=
ct.org
> <simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >> Thank you Bruce . I will do more research in that direction ( kernel
> configuration)
> >>
> >> Regards
> >> Simon
> >> > On Feb 25, 2023, at 5:20 PM, Bruce Ashfield <bruce.ashfield@gmail.co=
m>
> wrote:
> >> >
> >> > =EF=BB=BFOn Sat, Feb 25, 2023 at 5:35 PM SIMON BABY <simonkbaby@gmai=
l.com>
> wrote:
> >> >>
> >> >> Hi Bruce,
> >> >> I also observed that the docker daemon is not starting by default
> and if I launch it manually , it takes a long time to start. Am I missing
> any kernel modules?
> >> >>
> >> >> Here is the  o/p from  "systemctl status docker.service".
> >> >>
> >> >> root@imx8mpevk:~# systemctl status docker.service
> >> >> * docker.service - Docker Application Container Engine
> >> >>     Loaded: loaded (/lib/systemd/system/docker.service; disabled;
> vendor preset: disabled)
> >> >>     Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4mi=
n
> 10s ago
> >> >> TriggeredBy: * docker.socket
> >> >>       Docs: https://docs.docker.com
> >> >>   Main PID: 423 (dockerd)
> >> >>      Tasks: 11 (limit: 5578)
> >> >>     Memory: 115.0M
> >> >>     CGroup: /system.slice/docker.service
> >> >>             `-423 /usr/bin/dockerd -H fd://
> >> >>
> >> >> Feb 25 22:19:53 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running mo=
dprobe
> bridge br_netfilter failed with message: modprobe: WARNING: Module
> br_netfilter not found in director...ror: exit status 1"
> >> >
> >> > The above error could be a missing module, or a missing iptables
> module.
> >> >
> >> >
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.071250923Z" level=3Dwarning msg=3D"Could not =
load
> necessary modules for IPSEC rules: protocol not supported"
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.078250217Z" level=3Dwarning msg=3D"Could not =
load
> necessary modules for Conntrack: Running modprobe nf_conntrack_netlink
> failed with message: `modprobe: WARNING: Module nf_...
> >> >
> >> > As does the above one.
> >> >
> >> > so you definitely have missing configuration.
> >> >
> >> > Bruce
> >> >
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.081471487Z" level=3Dinfo msg=3D"Default bridg=
e
> (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option
> --bip can be used to set a preferred IP address"
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.199132980Z" level=3Dinfo msg=3D"Loading conta=
iners:
> done."
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.296845346Z" level=3Dinfo msg=3D"Docker daemon=
"
> commit=3D906f57ff5b-unsupported graphdriver(s)=3Doverlay2 version=3D20.10=
.12-ce
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.297236599Z" level=3Dinfo msg=3D"Daemon has co=
mpleted
> initialization"
> >> >> Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application
> Container Engine.
> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:54.372354197Z" level=3Dinfo msg=3D"API listen on
> /run/docker.sock"
> >> >> Feb 25 22:23:14 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:23:14.188738979Z" level=3Dinfo msg=3D"ignoring even=
t"
> container=3Da973c205bf7c0e57450de3241767f39e4983b6b174e231e014159ed8ae220=
791
> module=3Dlibcontainerd namespace...*events.TaskDelete"
> >> >> Hint: Some lines were ellipsized, use -l to show in full.
> >> >> root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]:
> time=3D"2023-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running mo=
dprobe
> bridge br_netfilter failed with message: modprobe: WARNING: Module
> br_netfilter not found in director...ror: exit status 1"
> >> >>
> >> >>
> >> >> Regards
> >> >> Simon
> >> >>
> >> >>> On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via
> lists.yoctoproject.org <simonkbaby=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >> >>>
> >> >>> Hello Bruce,
> >> >>>
> >> >>> Thank you for the inputs.
> >> >>>
> >> >>>
> >> >>> Yes, I use linux-yocto. The target linux version is below.
> >> >>>
> >> >>>
> >> >>>
> >> >>> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP
> PREEMPT_RT Tue Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
> >> >>>
> >> >>>
> >> >>>
> >> >>> The layers used are in the link below.
> >> >>>
> >> >>>
> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.15.32-=
2.0.0.xml?h=3Dimx-linux-kirkstone
> >> >>>
> >> >>>
> >> >>>
> >> >>> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in
> local.conf but it did not make any difference.
> >> >>>
> >> >>>
> >> >>>
> >> >>> The docker version I am running on the target is 20.10.12-ce
> >> >>>
> >> >>>
> >> >>>
> >> >>> Below is the error I am getting on the target.
> >> >>>
> >> >>>
> >> >>>
> >> >>> root@imx8mpevk:~# docker run hello-world
> >> >>>
> >> >>> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
> >> >>>
> >> >>> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
> >> >>>
> >> >>> [ 1359.005921] device veth4dc9000 entered promiscuous mode
> >> >>>
> >> >>> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37):
> dev=3Dveth4dc9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=
=3D0
> ses=3D4294967295
> >> >>>
> >> >>> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37):
> arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0=
d50 a2=3D28 a3=3D0
> items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 s=
uid=3D0 fsuid=3D0
> egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967295 comm=3D"dockerd=
"
> exe=3D"/usr/bin/dockerd" key=3D(null)
> >> >>>
> >> >>> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37):
> proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
> >> >>>
> >> >>> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
> >> >>>
> >> >>> [ 1359.298263] device veth4dc9000 left promiscuous mode
> >> >>>
> >> >>> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
> >> >>>
> >> >>> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38):
> dev=3Dveth4dc9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=
=3D0
> ses=3D4294967295
> >> >>>
> >> >>> docker: Error response from daemon: failed to create shim task: OC=
I
> runtime create failed: runc create failed: unable to start container
> process: can't get final child's PID from pipe: EOF: unknown.
> >> >>>
> >> >>> ERRO[0000] error waiting for container: context canceled
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>> Also sending the local.conf and bblayers.conf file
> >> >>>
> >> >>>
> >> >>>
> >> >>> local.conf:
> >> >>>
> >> >>>
> >> >>>
> >> >>> MACHINE ??=3D 'imx8mpevk'
> >> >>>
> >> >>> DISTRO ?=3D 'fsl-imx-wayland'
> >> >>>
> >> >>> PACKAGE_CLASSES ?=3D 'package_rpm'
> >> >>>
> >> >>> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
> >> >>>
> >> >>> USER_CLASSES ?=3D "buildstats"
> >> >>>
> >> >>> PATCHRESOLVE =3D "noop"
> >> >>>
> >> >>> BB_DISKMON_DIRS ??=3D "\
> >> >>>
> >> >>>    STOPTASKS,${TMPDIR},1G,100K \
> >> >>>
> >> >>>    STOPTASKS,${DL_DIR},1G,100K \
> >> >>>
> >> >>>    STOPTASKS,${SSTATE_DIR},1G,100K \
> >> >>>
> >> >>>   STOPTASKS,/tmp,100M,100K \
> >> >>>
> >> >>>    HALT,${TMPDIR},100M,1K \
> >> >>>
> >> >>>    HALT,${DL_DIR},100M,1K \
> >> >>>
> >> >>>    HALT,${SSTATE_DIR},100M,1K \
> >> >>>
> >> >>>    HALT,/tmp,10M,1K"
> >> >>>
> >> >>> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
> >> >>>
> >> >>> CONF_VERSION =3D "2"
> >> >>>
> >> >>>
> >> >>>
> >> >>> DL_DIR ?=3D "${BSPDIR}/downloads/"
> >> >>>
> >> >>> ACCEPT_FSL_EULA =3D "1"
> >> >>>
> >> >>>
> >> >>>
> >> >>> # Switch to Debian packaging and include package-management in the
> image
> >> >>>
> >> >>> PACKAGE_CLASSES =3D "package_deb"
> >> >>>
> >> >>> EXTRA_IMAGE_FEATURES +=3D "package-management"
> >> >>>
> >> >>> DISTRO_FEATURES:append =3D " virtualization"
> >> >>>
> >> >>> IMAGE_INSTALL:append =3D " docker-ce"
> >> >>>
> >> >>> IMAGE_INSTALL:append =3D " kernel-modules"
> >> >>>
> >> >>>
> >> >>>
> >> >>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >>> bblayers.conf
> >> >>>
> >> >>>
> >> >>>
> >> >>> LCONF_VERSION =3D "7"
> >> >>>
> >> >>>
> >> >>>
> >> >>> BBPATH =3D "${TOPDIR}"
> >> >>>
> >> >>> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE',
> True)) + '/../..')}
> >> >>>
> >> >>>
> >> >>>
> >> >>> BBFILES ?=3D ""
> >> >>>
> >> >>> BBLAYERS =3D " \
> >> >>>
> >> >>>  ${BSPDIR}/sources/poky/meta \
> >> >>>
> >> >>>  ${BSPDIR}/sources/poky/meta-poky \
> >> >>>
> >> >>>  \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-oe \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-python \
> >> >>>
> >> >>>  \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-freescale \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-freescale-3rdparty \
> >> >>>
> >> >>>  ${BSPDIR}/sources/meta-freescale-distro \
> >> >>>
> >> >>> "
> >> >>>
> >> >>>
> >> >>>
> >> >>> # i.MX Yocto Project Release layers
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
> >> >>>
> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
> >> >>>
> >> >>>
> >> >>>
> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
> >> >>>
> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
> >> >>>
> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking=
"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystem=
s"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
> >> >>>
> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
> >> >>>
> >> >>>
> >> >>>
> >> >>> Regards
> >> >>>
> >> >>> Simon
> >> >>>
> >> >>>
> >> >>> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >> >>>>
> >> >>>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com>
> wrote:
> >> >>>>>
> >> >>>>> Hello Team,
> >> >>>>>
> >> >>>>> Can I know what are the changes required in yocto to run docker
> and its dependencies  on my target embedded system. I have added the belo=
w
> changes. Do I need more plugins and packages ?
> >> >>>>>
> >> >>>>> bblayers.conf:
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networki=
ng"
> >> >>>>>
> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesyst=
ems"
> >> >>>>>
> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> local.conf:
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> DISTRO_FEATURES:append =3D " virtualization"
> >> >>>>>
> >> >>>>> IMAGE_INSTALL:append =3D " docker-ce"
> >> >>>>>
> >> >>>>
> >> >>>> You likely are missing kernel configuration values required to ru=
n
> the
> >> >>>> containers.
> >> >>>>
> >> >>>> What kernel are you using (linux-yocto?), and are you on the mast=
er
> >> >>>> branch of the layers ?
> >> >>>>
> >> >>>> As you can see, it is working in my latest tests:
> >> >>>>
> >> >>>> root@qemux86-64:~# docker --version
> >> >>>> Docker version 23.0.1, build a5ee5b1dfc
> >> >>>> root@qemux86-64:~# docker pull alpine
> >> >>>> Using default tag: latest
> >> >>>> latest: Pulling from library/alpine
> >> >>>> 63b65145d645: Pull complete
> >> >>>> Digest:
> sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a10ba3f0efb90a
> >> >>>> Status: Downloaded newer image for alpine:latest
> >> >>>> docker.io/library/alpine:latest
> >> >>>> root@qemux86-64:~# docker run -it alpine /bin/sh
> >> >>>> / #
> >> >>>>
> >> >>>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if tha=
t
> >> >>>> makes a difference.
> >> >>>>
> >> >>>> Bruce
> >> >>>>
> >> >>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> WIth the above changes and tested on the target I am getting the
> below error when try to run "docker run hello-world"
> >> >>>>>
> >> >>>>>
> >> >>>>> root@imx8mpevk:~# docker run hello-world
> >> >>>>> DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
> >> >>>>> DEBU[2023-02-23T00:53:57.068355788Z] Calling POST
> /v1.41/containers/create
> >> >>>>> DEBU[2023-02-23T00:53:57.069098805Z] form data:
> {=E2=80=9CAttachStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=
=E2=80=9CAttachStdout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDom=
ainname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=
=80=9CEnv=E2=80=9D:null,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=
=E2=80=9D:false,=E2=80=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=
=80=9D:null,=E2=80=9CBlkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDevice=
WriteBps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=
=9CBlkioWeight=E2=80=9D:0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCap=
Add=E2=80=9D:null,=E2=80=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CCgroupnsMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[=
0,0],=E2=80=9CContainerIDFile=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=
=E2=80=9D:0,=E2=80=9CCpuPercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=
=E2=80=9CCpuQuota=E2=80=9D:0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=
=9CCpuRealtimeRuntime=E2=80=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpu=
setCpus=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CDeviceCgroupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=
=E2=80=9D:null,=E2=80=9CDevices=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CD=
nsOptions=E2=80=9D:,=E2=80=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=
=9D:null,=E2=80=9CGroupAdd=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=
=9D:0,=E2=80=9CIOMaximumIOps=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CIsolation=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMem=
ory=E2=80=9D:0,=E2=80=9CKernelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:=
null,=E2=80=9CLogConfig=E2=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=
=E2=80=9D:=E2=80=9C=E2=80=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CM=
emory=E2=80=9D:0,=E2=80=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=
=E2=80=9D:0,=E2=80=9CMemorySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=
=9D:0,=E2=80=9CNetworkMode=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomK=
illDisable=E2=80=9D:false,=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=
=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBin=
dings=E2=80=9D:{},=E2=80=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPor=
ts=E2=80=9D:false,=E2=80=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRoo=
tfs=E2=80=9D:false,=E2=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCo=
unt=E2=80=9D:0,=E2=80=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecuri=
tyOpt=E2=80=9D:null,=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=
=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CVolumesFrom=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=
=80=9D,=E2=80=9CImage=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabel=
s=E2=80=9D:{},=E2=80=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=
=E2=80=9D:{}},=E2=80=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:fa=
lse,=E2=80=9CPlatform=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=
=80=9CTty=E2=80=9D:false,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CVolumes=E2=80=9D:{},=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}
> >> >>>>> DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking
> state
> >> >>>>> [25846.681041] docker0: port 1(veth659d267) entered disabled sta=
te
> >> >>>>> [2023-02-23T00:53:57.121358454Z] [25846.681312] device
> veth659d267 entered promiscuous mode
> >> >>>>> container mounted via layerStore:[25846.681392] audit: type=3D17=
00
> audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
> >> >>>>> &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D130=
0
> audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes ex=
it=3D40
> a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 aui=
d=3D4294967295
> uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 t=
ty=3Dttymxc1
> ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin=
/dockerd=E2=80=9D key=3D(null)
> >> >>>>> 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D13=
27
> audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B65726400=
2D44
> >> >>>>> aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060}
> container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d=
190
> >> >>>>> DEBU[2023-02-23T00:53:57.184741848Z] Calling POST
> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9ed=
bdb62d190/attach?stderr=3D1&stdout=3D1&stream=3D1
> >> >>>>> DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
> >> >>>>> DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
> >> >>>>> DEBU[2023-02-23T00:53:57.186340258Z] Calling POST
> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9ed=
bdb62d190/wait?condition=3Dnext-exit
> >> >>>>> DEBU[2023-02-23T00:53:57.188347802Z] Calling POST
> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9ed=
bdb62d190/start
> >> >>>>> DEBU[2023-02-23T00:53:57.190864983Z] container mounted via
> layerStore:
> &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2994ae=
5b99b3bcb65c33ec2f/merged
> 0xaaaabdb0b060 0xaaaabdb0b060}
> container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d=
190
> >> >>>>> DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for
> endpoint crazy_bell=E2=80=99s interface on network bridge
> >> >>>>> DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault=
/
> 172.17.0.0/16, , map)
> >> >>>>> DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:
> 172.17.0.0/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16,
> DBIndex: 0x0, Bits: 65536, Unselected: 65533, Sequence: (0xc0000000,
> 1)->(0x0, 2046)->(0x1, 1)->end Curr:3 Serial:false PrefAddress:
> >> >>>>> ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial
> namespace, readlink /proc/1551/task/1555/ns/net: no such file or director=
y,
> initns fd -1: bad file descriptor
> >> >>>>> DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for
> endpoint crazy_bell=E2=80=99s interface on network bridge
> >> >>>>> ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial
> namespace, readlink /proc/1551/task/1555/ns/net: no such file or director=
y,
> initns fd -1: bad file descriptor
> >> >>>>> DEBU[2023-02-23T00:53:57.294111754Z] Programming external
> connectivity on endpoint crazy_bell
> (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
> >> >>>>> ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844]
> docker0: port 1(veth659d267) entered disabled state
> >> >>>>> to set to initial namespace, readlink
> /proc/1551/task/1555/ns/net: no such file or directory, initns fd -1: bad
> file descriptor
> >> >>>>> DEBU[2023-02-23T00:53:57.304933242Z] EnableService
> 4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
> >> >>>>> DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device
> veth659d267 left promiscuous mode
> >> >>>>> eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port
> 1(veth659d267) entered disabled state
> >> >>>>> [25846.996703] audit: type=3D1700 audit(1677113637.488:206):
> dev=3Dveth659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=
=3D0
> ses=3D4294967295
> >> >>>>> 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
> >> >>>>> DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created
> bundle=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19e=
f[25847.040986]
> audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=3D2=
06
> success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=3D0 p=
pid=3D409 pid=3D1551
> auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sg=
id=3D0 fsgid=3D0
> tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=
=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
> >> >>>>> [25847.041004] audit: type=3D1327 audit(1677113637.488:206):
> proctitle=3D2F7573722F62696E2F646F636B657264002D44
> >> >>>>> 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmo=
by
> root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa2=
994ae5b99b3bcb65c33ec2f/merged
> >> >>>>> ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading
> from a closed fifo
> >> >>>>> ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading
> from a closed fifo
> >> >>>>> DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
> >> >>>>> DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
> >> >>>>> DEBU[2023-02-23T00:53:57.445349705Z] attach done
> >> >>>>> DEBU[2023-02-23T00:53:57.469084602Z] Revoking external
> connectivity on endpoint crazy_bell
> (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe731042007ec0ebd3c)
> >> >>>>> ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial
> namespace, readlink /proc/1551/task/1558/ns/net: no such file or director=
y,
> initns fd -1: bad file descriptor
> >> >>>>> ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial
> namespace, readlink /proc/1551/task/1558/ns/net: no such file or director=
y,
> initns fd -1: bad file descriptor
> >> >>>>> ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial
> namespace, readlink /proc/1551/task/1558/ns/net: no such file or director=
y,
> initns fd -1: bad file descriptor
> >> >>>>> DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for
> endpoint crazy_bell=E2=80=99s interface on network bridge
> >> >>>>> DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault=
/
> 172.17.0.0/16, 172.17.0.2)
> >> >>>>> DEBU[2023-02-23T00:53:57.619890544Z] Released address
> PoolID:LocalDefault/172.17.0.0/16, Address:172.17.0.2 Sequence:App:
> ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits:
> 65536, Unselected: 65532, Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1,
> 1)->end Curr:3
> >> >>>>> ERRO[2023-02-23T00:53:57.659608292Z]
> 4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup:
> failed to delete container from containerd: no such container
> >> >>>>> ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST
> /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9ed=
bdb62d190/start
> returned error: failed to create shim task: OCI runtime create failed: ru=
nc
> create failed: unable to start container process: can=E2=80=99t get final=
 child=E2=80=99s
> PID from pipe: EOF: unknown
> >> >>>>> docker: Error response from daemon: failed to create shim task:
> OCI runtime create failed: runc create failed: unable to start container
> process: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unkn=
own.
> >> >>>>> ERRO[0000] error waiting for container: context canceled
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>> Regards
> >> >>>>>
> >> >>>>> Simon
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>
> >> >>>>
> >> >>>> --
> >> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> >>>> thee at its end
> >> >>>> - "Use the force Harry" - Gandalf, Star Trek II
> >> >>>
> >> >>>
> >> >>>
> >> >>>
> >> >
> >> >
> >> > --
> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >> > thee at its end
> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7902):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7902
> >> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/4946642
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b
> [simonkbaby@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000f756b605f5d8bafb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Bruce,<div><br></div><div>Of course, you won&#39;t a=
lways see the daemon running on startup, as<br>there are socket and other s=
ystemd triggers that will launch the<br>daemon when required (and it will c=
ontinue to run after that).</div><div><font color=3D"#b45f06">Simon&gt; The=
 daemon is not starting by default after every boot. I need to type any doc=
ker command and wait for 2-3 minutes to get docker run.</font><br></div><di=
v><div><div class=3D"gmail-adm" style=3D"margin:5px 0px"><div id=3D"gmail-q=
_279" class=3D"gmail-ajR gmail-h4" style=3D"background-color:rgb(232,234,23=
7);border:none;clear:both;line-height:6px;outline:none;width:24px;color:rgb=
(80,0,80);font-size:11px;border-radius:5.5px"><div class=3D"gmail-ajT" styl=
e=3D"background:url(&quot;https://www.gstatic.com/images/icons/material/sys=
tem_gm/1x/more_horiz_black_20dp.png&quot;) 50% 50%/20px no-repeat;height:11=
px;opacity:0.71;width:24px"></div></div></div></div>If you add docker-ce-co=
ntrib (or docker-moby-contrib, depending on<br>what flavour you are buildin=
g), one of the docker supplied scripts<br>will be installed to the target. =
You can use that to check the running<br>kernel configuration and look for =
issues.</div><div><font color=3D"#783f04">Simon&gt; yes I run the script ch=
eck-config.sh and below is the o/p</font></div><div><br></div><div><br></di=
v><div><br></div><div>Generally Necessary:<br>- cgroup hierarchy: properly =
mounted [/sys/fs/cgroup]<br>- CONFIG_NAMESPACES: enabled<br>- CONFIG_NET_NS=
: enabled<br>- CONFIG_PID_NS: enabled<br>- CONFIG_IPC_NS: enabled<br>- CONF=
IG_UTS_NS: enabled<br>- CONFIG_CGROUPS: enabled<br>- CONFIG_CGROUP_CPUACCT:=
 enabled<br>- CONFIG_CGROUP_DEVICE: enabled<br>- CONFIG_CGROUP_FREEZER: ena=
bled<br>- CONFIG_CGROUP_SCHED: enabled<br>- CONFIG_CPUSETS: enabled<br>- CO=
NFIG_MEMCG: missing<br>- CONFIG_KEYS: enabled<br>- CONFIG_VETH: enabled (as=
 module)<br>- CONFIG_BRIDGE: enabled<br>- CONFIG_BRIDGE_NETFILTER: enabled =
(as module)<br>- CONFIG_IP_NF_FILTER: enabled (as module)<br>- CONFIG_IP_NF=
_TARGET_MASQUERADE: enabled (as module)<br>- CONFIG_NETFILTER_XT_MATCH_ADDR=
TYPE: enabled (as module)<br>- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled=
 (as module)<br>- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)<br>- =
CONFIG_NETFILTER_XT_MARK: enabled (as module)<br>- CONFIG_IP_NF_NAT: enable=
d<br>- CONFIG_NF_NAT: enabled<br>- CONFIG_POSIX_MQUEUE: enabled<br>- CONFIG=
_CGROUP_BPF: enabled<br><br>Optional Features:<br>- CONFIG_USER_NS: enabled=
<br>- CONFIG_SECCOMP: enabled<br>- CONFIG_SECCOMP_FILTER: enabled<br>- CONF=
IG_CGROUP_PIDS: enabled<br>- CONFIG_MEMCG_SWAP: missing<br>=C2=A0 =C2=A0 (c=
group swap accounting is currently enabled)<br>- CONFIG_BLK_CGROUP: enabled=
<br>- CONFIG_BLK_DEV_THROTTLING: enabled<br>- CONFIG_CGROUP_PERF: enabled<b=
r>- CONFIG_CGROUP_HUGETLB: enabled<br>- CONFIG_NET_CLS_CGROUP: enabled (as =
module)<br>- CONFIG_CGROUP_NET_PRIO: enabled<br>- CONFIG_CFS_BANDWIDTH: ena=
bled<br>- CONFIG_FAIR_GROUP_SCHED: enabled<br>- CONFIG_RT_GROUP_SCHED: enab=
led<br>- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)<br>- CONFIG_IP_V=
S: enabled (as module)<br>- CONFIG_IP_VS_NFCT: enabled<br>- CONFIG_IP_VS_PR=
OTO_TCP: enabled<br>- CONFIG_IP_VS_PROTO_UDP: enabled<br>- CONFIG_IP_VS_RR:=
 enabled (as module)<br>- CONFIG_SECURITY_SELINUX: enabled<br>- CONFIG_SECU=
RITY_APPARMOR: enabled<br>- CONFIG_EXT3_FS: enabled<br>- CONFIG_EXT3_FS_XAT=
TR: missing<br>- CONFIG_EXT3_FS_POSIX_ACL: enabled<br>- CONFIG_EXT3_FS_SECU=
RITY: enabled<br>=C2=A0 =C2=A0 (enable these ext3 configs if you are using =
ext3 as backing filesystem)<br>- CONFIG_EXT4_FS: enabled<br>- CONFIG_EXT4_F=
S_POSIX_ACL: enabled<br>- CONFIG_EXT4_FS_SECURITY: enabled<br>- Network Dri=
vers:<br>=C2=A0 - &quot;overlay&quot;:<br>=C2=A0 =C2=A0 - CONFIG_VXLAN: ena=
bled (as module)<br>=C2=A0 =C2=A0 - CONFIG_BRIDGE_VLAN_FILTERING: enabled<b=
r>=C2=A0 =C2=A0 =C2=A0 Optional (for encrypted networks):<br>=C2=A0 =C2=A0 =
=C2=A0 - CONFIG_CRYPTO: enabled<br>=C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO_AEA=
D: enabled<br>=C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO_GCM: enabled<br>=C2=A0 =
=C2=A0 =C2=A0 - CONFIG_CRYPTO_SEQIV: enabled<br>=C2=A0 =C2=A0 =C2=A0 - CONF=
IG_CRYPTO_GHASH: enabled<br>=C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM: enabled<br>=
=C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM_USER: enabled<br>=C2=A0 =C2=A0 =C2=A0 - =
CONFIG_XFRM_ALGO: enabled<br>=C2=A0 =C2=A0 =C2=A0 - CONFIG_INET_ESP: enable=
d<br>=C2=A0 - &quot;ipvlan&quot;:<br>=C2=A0 =C2=A0 - CONFIG_IPVLAN: enabled=
 (as module)<br>=C2=A0 - &quot;macvlan&quot;:<br>=C2=A0 =C2=A0 - CONFIG_MAC=
VLAN: enabled (as module)<br>=C2=A0 =C2=A0 - CONFIG_DUMMY: enabled (as modu=
le)<br>=C2=A0 - &quot;ftp,tftp client in container&quot;:<br>=C2=A0 =C2=A0 =
- CONFIG_NF_NAT_FTP: enabled (as module)<br>=C2=A0 =C2=A0 - CONFIG_NF_CONNT=
RACK_FTP: enabled (as module)<br>=C2=A0 =C2=A0 - CONFIG_NF_NAT_TFTP: enable=
d (as module)<br>=C2=A0 =C2=A0 - CONFIG_NF_CONNTRACK_TFTP: enabled (as modu=
le)<br>- Storage Drivers:<br>=C2=A0 - &quot;aufs&quot;:<br>=C2=A0 =C2=A0 - =
CONFIG_AUFS_FS: missing<br>=C2=A0 - &quot;btrfs&quot;:<br>=C2=A0 =C2=A0 - C=
ONFIG_BTRFS_FS: enabled (as module)<br>=C2=A0 =C2=A0 - CONFIG_BTRFS_FS_POSI=
X_ACL: enabled<br>=C2=A0 - &quot;devicemapper&quot;:<br>=C2=A0 =C2=A0 - CON=
FIG_BLK_DEV_DM: enabled (as module)<br>=C2=A0 =C2=A0 - CONFIG_DM_THIN_PROVI=
SIONING: enabled (as module)<br>=C2=A0 - &quot;overlay&quot;:<br>=C2=A0 =C2=
=A0 - CONFIG_OVERLAY_FS: enabled (as module)<br>=C2=A0 - &quot;zfs&quot;:<b=
r>=C2=A0 =C2=A0 - /dev/zfs: missing<br>=C2=A0 =C2=A0 - zfs command: missing=
<br>=C2=A0 =C2=A0 - zpool command: missing<br><br>You&#39;ll find that scri=
pt at: /usr/share/docker/check-config.sh<font color=3D"#888888"><br></font>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Feb 27, 2023 at 6:26=E2=80=AFAM Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Feb 26, 2=
023 at 1:42 PM SIMON BABY &lt;<a href=3D"mailto:simonkbaby@gmail.com" targe=
t=3D"_blank">simonkbaby@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt; I have enabled some of the kernel flags. I am able to run the docker r=
un command. But I see some logs when I run=C2=A0 the command even though it=
 is executed. I also observed that docker daemon is not starting by default=
 after every reboot. Do we have any specific fix for this?<br>
&gt;<br>
<br>
There&#39;s no specific fix for that, because it isn&#39;t broken in anythi=
ng<br>
that I&#39;ve seen. docker starts fine on boot in all of my test cases.<br>
<br>
Of course, you won&#39;t always see the daemon running on startup, as<br>
there are socket and other systemd triggers that will launch the<br>
daemon when required (and it will continue to run after that).<br>
<br>
&gt;<br>
&gt; root@imx8mpevk:~# docker run hello-world<br>
&gt; [=C2=A0 271.841466] docker0: port 1(vethd66b82d) entered blocking stat=
e<br>
&gt; [=C2=A0 271.847462] docker0: port 1(vethd66b82d) entered disabled stat=
e<br>
&gt; [=C2=A0 271.853592] device vethd66b82d entered promiscuous mode<br>
&gt; [=C2=A0 271.858934] audit: type=3D1700 audit(1677436586.264:37): dev=
=3Dvethd66b82d prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 se=
s=3D4294967295<br>
&gt; [=C2=A0 271.871031] audit: type=3D1300 audit(1677436586.264:37): arch=
=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3Df a1=3D4000f54c90 a2=
=3D28 a3=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0=
 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=
=3D4294967295 comm=3D&quot;dockerd&quot; exe=3D&quot;/usr/bin/dockerd&quot;=
 subj=3Dkernel key=3D(null)<br>
&gt; [=C2=A0 271.898659] audit: type=3D1327 audit(1677436586.264:37): proct=
itle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F<br>
&gt; [=C2=A0 272.315534] eth0: renamed from veth95a7c15<br>
&gt; [=C2=A0 272.326397] IPv6: ADDRCONF(NETDEV_CHANGE): vethd66b82d: link b=
ecomes ready<br>
&gt; [=C2=A0 272.333388] docker0: port 1(vethd66b82d) entered blocking stat=
e<br>
&gt; [=C2=A0 272.339340] docker0: port 1(vethd66b82d) entered forwarding st=
ate<br>
&gt;<br>
&gt; Hello from Docker!<br>
&gt; This message shows that your installation appears to be working correc=
tly.<br>
&gt;<br>
&gt; To generate this message, Docker took the following steps:<br>
&gt;=C2=A0 1. The Docker client contacted the Docker daemon.<br>
&gt;=C2=A0 2. The Docker daemon pulled the &quot;hello-world&quot; image fr=
om the Docker Hub.<br>
&gt;=C2=A0 =C2=A0 =C2=A0(arm64v8)<br>
&gt;=C2=A0 3. The Docker daemon created a new container from that image whi=
ch runs the<br>
&gt;=C2=A0 =C2=A0 =C2=A0executable that produces the output you are current=
ly reading.<br>
&gt;=C2=A0 4. The Docker daemon streamed that output to the Docker client, =
which sent it<br>
&gt;=C2=A0 =C2=A0 =C2=A0to your terminal.<br>
&gt;<br>
&gt; To try something more ambitious, you can run an Ubuntu container with:=
<br>
&gt;=C2=A0 $ docker run -it ubuntu bash<br>
&gt;<br>
&gt; Share images, automate workflows, and more with a free Docker ID:<br>
&gt;=C2=A0 <a href=3D"https://hub.docker.com/" rel=3D"noreferrer" target=3D=
"_blank">https://hub.docker.com/</a><br>
&gt;<br>
&gt; For more examples and ideas, visit:<br>
&gt;=C2=A0 <a href=3D"https://docs.docker.com/get-started/" rel=3D"noreferr=
er" target=3D"_blank">https://docs.docker.com/get-started/</a><br>
&gt;<br>
&gt; [=C2=A0 272.466210] docker0: port 1(vethd66b82d) entered disabled stat=
e<br>
&gt; [=C2=A0 272.472523] veth95a7c15: renamed from eth0<br>
&gt; [=C2=A0 272.505514] docker0: port 1(vethd66b82d) entered disabled stat=
e<br>
&gt; [=C2=A0 272.513799] device vethd66b82d left promiscuous mode<br>
&gt; [=C2=A0 272.518809] docker0: port 1(vethd66b82d) entered disabled stat=
e<br>
&gt; [=C2=A0 272.518828] audit: type=3D1700 audit(1677436586.928:38): dev=
=3Dvethd66b82d prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 se=
s=3D4294967295<br>
&gt; [=C2=A0 272.550854] audit: type=3D1300 audit(1677436586.928:38): arch=
=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D32 a0=3Df a1=3D400014dfe0 a2=
=3D20 a3=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0=
 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=
=3D4294967295 comm=3D&quot;dockerd&quot; exe=3D&quot;/usr/bin/dockerd&quot;=
 subj=3Dkernel key=3D(null)<br>
&gt; [=C2=A0 272.578481] audit: type=3D1327 audit(1677436586.928:38): proct=
itle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F<br>
&gt;<br>
&gt;<br>
&gt; I have compared all the kernel configuration between my local ubuntu l=
inux and the imx8 I am running. Below are all the kernel configuration set =
on my target for the docker to run (as per nxp manual)<br>
&gt;<br>
<br>
If you add docker-ce-contrib (or docker-moby-contrib, depending on<br>
what flavour you are building), one of the docker supplied scripts<br>
will be installed to the target. You can use that to check the running<br>
kernel configuration and look for issues.<br>
<br>
You&#39;ll find that script at: /usr/share/docker/check-config.sh<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;<br>
&gt; root@imx8mpevk:~# sh kernel.sh<br>
&gt; info: reading kernel config from /proc/config.gz ...<br>
&gt;<br>
&gt; Generally Necessary:<br>
&gt; - cgroup hierarchy: properly mounted [/sys/fs/cgroup]<br>
&gt; - CONFIG_NAMESPACES: enabled<br>
&gt; - CONFIG_NET_NS: enabled<br>
&gt; - CONFIG_PID_NS: enabled<br>
&gt; - CONFIG_IPC_NS: enabled<br>
&gt; - CONFIG_UTS_NS: enabled<br>
&gt; - CONFIG_CGROUPS: enabled<br>
&gt; - CONFIG_CGROUP_CPUACCT: enabled<br>
&gt; - CONFIG_CGROUP_DEVICE: enabled<br>
&gt; - CONFIG_CGROUP_FREEZER: enabled<br>
&gt; - CONFIG_CGROUP_SCHED: enabled<br>
&gt; - CONFIG_CPUSETS: enabled<br>
&gt; - CONFIG_MEMCG: enabled<br>
&gt; - CONFIG_KEYS: enabled<br>
&gt; - CONFIG_VETH: enabled (as module)<br>
&gt; - CONFIG_BRIDGE: enabled<br>
&gt; - CONFIG_BRIDGE_NETFILTER: enabled (as module)<br>
&gt; - CONFIG_IP_NF_FILTER: enabled (as module)<br>
&gt; - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)<br>
&gt; - CONFIG_NETFILTER_XT_MARK: enabled (as module)<br>
&gt; - CONFIG_IP_NF_NAT: enabled<br>
&gt; - CONFIG_NF_NAT: enabled<br>
&gt; - CONFIG_POSIX_MQUEUE: enabled<br>
&gt; - CONFIG_CGROUP_BPF: missing<br>
&gt;<br>
&gt; Optional Features:<br>
&gt; - CONFIG_USER_NS: enabled<br>
&gt; - CONFIG_SECCOMP: enabled<br>
&gt; - CONFIG_SECCOMP_FILTER: enabled<br>
&gt; - CONFIG_CGROUP_PIDS: enabled<br>
&gt; - CONFIG_MEMCG_SWAP: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0(cgroup swap accounting is currently enabled)<br>
&gt; - CONFIG_BLK_CGROUP: enabled<br>
&gt; - CONFIG_BLK_DEV_THROTTLING: enabled<br>
&gt; - CONFIG_CGROUP_PERF: enabled<br>
&gt; - CONFIG_CGROUP_HUGETLB: enabled<br>
&gt; - CONFIG_NET_CLS_CGROUP: enabled (as module)<br>
&gt; - CONFIG_CGROUP_NET_PRIO: enabled<br>
&gt; - CONFIG_CFS_BANDWIDTH: enabled<br>
&gt; - CONFIG_FAIR_GROUP_SCHED: enabled<br>
&gt; - CONFIG_RT_GROUP_SCHED: missing<br>
&gt; - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)<br>
&gt; - CONFIG_IP_VS: enabled (as module)<br>
&gt; - CONFIG_IP_VS_NFCT: enabled<br>
&gt; - CONFIG_IP_VS_PROTO_TCP: enabled<br>
&gt; - CONFIG_IP_VS_PROTO_UDP: enabled<br>
&gt; - CONFIG_IP_VS_RR: enabled (as module)<br>
&gt; - CONFIG_SECURITY_SELINUX: enabled<br>
&gt; - CONFIG_SECURITY_APPARMOR: enabled<br>
&gt; - CONFIG_EXT3_FS: enabled<br>
&gt; - CONFIG_EXT3_FS_XATTR: missing<br>
&gt; - CONFIG_EXT3_FS_POSIX_ACL: missing<br>
&gt; - CONFIG_EXT3_FS_SECURITY: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0(enable these ext3 configs if you are using ext3 as=
 backing filesystem)<br>
&gt; - CONFIG_EXT4_FS: enabled<br>
&gt; - CONFIG_EXT4_FS_POSIX_ACL: enabled<br>
&gt; - CONFIG_EXT4_FS_SECURITY: enabled<br>
&gt; - Network Drivers:<br>
&gt;=C2=A0 =C2=A0- &quot;overlay&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_VXLAN: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BRIDGE_VLAN_FILTERING: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Optional (for encrypted networks):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_AEAD: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_GCM: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_SEQIV: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_GHASH: enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM_USER: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM_ALGO: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_INET_ESP: missing<br>
&gt;=C2=A0 =C2=A0- &quot;ipvlan&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_IPVLAN: enabled (as module)<br>
&gt;=C2=A0 =C2=A0- &quot;macvlan&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_MACVLAN: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_DUMMY: enabled (as module)<br>
&gt;=C2=A0 =C2=A0- &quot;ftp,tftp client in container&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_NAT_FTP: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_CONNTRACK_FTP: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_NAT_TFTP: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_CONNTRACK_TFTP: enabled (as module)<br>
&gt; - Storage Drivers:<br>
&gt;=C2=A0 =C2=A0- &quot;aufs&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_AUFS_FS: missing<br>
&gt;=C2=A0 =C2=A0- &quot;btrfs&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BTRFS_FS: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BTRFS_FS_POSIX_ACL: enabled<br>
&gt;=C2=A0 =C2=A0- &quot;devicemapper&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BLK_DEV_DM: enabled (as module)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_DM_THIN_PROVISIONING: enabled (as module)<=
br>
&gt;=C2=A0 =C2=A0- &quot;overlay&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_OVERLAY_FS: enabled (as module)<br>
&gt;=C2=A0 =C2=A0- &quot;zfs&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- /dev/zfs: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0- zfs command: missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0- zpool command: missing<br>
&gt;<br>
&gt;<br>
&gt; Regards<br>
&gt; Simon<br>
&gt;<br>
&gt; On Sat, Feb 25, 2023 at 5:27=E2=80=AFPM SIMON BABY via <a href=3D"http=
://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yocto=
project.org</a> &lt;simonkbaby=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Thank you Bruce . I will do more research in that direction ( kern=
el configuration)<br>
&gt;&gt;<br>
&gt;&gt; Regards<br>
&gt;&gt; Simon<br>
&gt;&gt; &gt; On Feb 25, 2023, at 5:20 PM, Bruce Ashfield &lt;<a href=3D"ma=
ilto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =EF=BB=BFOn Sat, Feb 25, 2023 at 5:35 PM SIMON BABY &lt;<a hr=
ef=3D"mailto:simonkbaby@gmail.com" target=3D"_blank">simonkbaby@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Bruce,<br>
&gt;&gt; &gt;&gt; I also observed that the docker daemon is not starting by=
 default and if I launch it manually , it takes a long time to start. Am I =
missing any kernel modules?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Here is the=C2=A0 o/p from=C2=A0 &quot;systemctl status d=
ocker.service&quot;.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; root@imx8mpevk:~# systemctl status docker.service<br>
&gt;&gt; &gt;&gt; * docker.service - Docker Application Container Engine<br=
>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/do=
cker.service; disabled; vendor preset: disabled)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Active: active (running) since Sat 202=
3-02-25 22:19:54 UTC; 4min 10s ago<br>
&gt;&gt; &gt;&gt; TriggeredBy: * docker.socket<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Docs: <a href=3D"https://docs.d=
ocker.com" rel=3D"noreferrer" target=3D"_blank">https://docs.docker.com</a>=
<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0Main PID: 423 (dockerd)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Tasks: 11 (limit: 5578)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Memory: 115.0M<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0CGroup: /system.slice/docker.service<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-423 /usr=
/bin/dockerd -H fd://<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:53.837738928Z&quot; level=3Dwarning msg=3D&quot;Running modpro=
be bridge br_netfilter failed with message: modprobe: WARNING: Module br_ne=
tfilter not found in director...ror: exit status 1&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The above error could be a missing module, or a missing iptab=
les module.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.071250923Z&quot; level=3Dwarning msg=3D&quot;Could not load=
 necessary modules for IPSEC rules: protocol not supported&quot;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.078250217Z&quot; level=3Dwarning msg=3D&quot;Could not load=
 necessary modules for Conntrack: Running modprobe nf_conntrack_netlink fai=
led with message: `modprobe: WARNING: Module nf_...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As does the above one.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; so you definitely have missing configuration.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Bruce<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.081471487Z&quot; level=3Dinfo msg=3D&quot;Default bridge (d=
ocker0) is assigned with an IP address <a href=3D"http://172.17.0.0/16" rel=
=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>. Daemon option --bip ca=
n be used to set a preferred IP address&quot;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.199132980Z&quot; level=3Dinfo msg=3D&quot;Loading container=
s: done.&quot;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.296845346Z&quot; level=3Dinfo msg=3D&quot;Docker daemon&quo=
t; commit=3D906f57ff5b-unsupported graphdriver(s)=3Doverlay2 version=3D20.1=
0.12-ce<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.297236599Z&quot; level=3Dinfo msg=3D&quot;Daemon has comple=
ted initialization&quot;<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Appl=
ication Container Engine.<br>
&gt;&gt; &gt;&gt; Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:19:54.372354197Z&quot; level=3Dinfo msg=3D&quot;API listen on /ru=
n/docker.sock&quot;<br>
&gt;&gt; &gt;&gt; Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D&quot;2023=
-02-25T22:23:14.188738979Z&quot; level=3Dinfo msg=3D&quot;ignoring event&qu=
ot; container=3Da973c205bf7c0e57450de3241767f39e4983b6b174e231e014159ed8ae2=
20791 module=3Dlibcontainerd namespace...*events.TaskDelete&quot;<br>
&gt;&gt; &gt;&gt; Hint: Some lines were ellipsized, use -l to show in full.=
<br>
&gt;&gt; &gt;&gt; root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]:=
 time=3D&quot;2023-02-25T22:19:53.837738928Z&quot; level=3Dwarning msg=3D&q=
uot;Running modprobe bridge br_netfilter failed with message: modprobe: WAR=
NING: Module br_netfilter not found in director...ror: exit status 1&quot;<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Regards<br>
&gt;&gt; &gt;&gt; Simon<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via <a hre=
f=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.yoctoproject.org</a> &lt;simonkbaby=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Hello Bruce,<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Thank you for the inputs.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Yes, I use linux-yocto. The target linux version is b=
elow.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #=
1 SMP PREEMPT_RT Tue Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Li=
nux<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; The layers used are in the link below.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; <a href=3D"https://source.codeaurora.org/external/imx=
/imx-manifest/tree/imx-5.15.32-2.0.0.xml?h=3Dimx-linux-kirkstone" rel=3D"no=
referrer" target=3D"_blank">https://source.codeaurora.org/external/imx/imx-=
manifest/tree/imx-5.15.32-2.0.0.xml?h=3Dimx-linux-kirkstone</a><br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; I tried to add IMAGE_INSTALL:append =3D &quot; kernel=
-modules&quot; in local.conf but it did not make any difference.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; The docker version I am running on the target is 20.1=
0.12-ce<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Below is the error I am getting on the target.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; root@imx8mpevk:~# docker run hello-world<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.005452] docker0: port 1(veth4dc9000) entered b=
locking state<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.005512] docker0: port 1(veth4dc9000) entered d=
isabled state<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.005921] device veth4dc9000 entered promiscuous=
 mode<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.005994] audit: type=3D1700 audit(1677283528.91=
4:37): dev=3Dveth4dc9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 =
gid=3D0 ses=3D4294967295<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.013139] audit: type=3D1300 audit(1677283528.91=
4:37): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D40=
00ec0d50 a2=3D28 a3=3D0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=
=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D=
(none) ses=3D4294967295 comm=3D&quot;dockerd&quot; exe=3D&quot;/usr/bin/doc=
kerd&quot; key=3D(null)<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.013228] audit: type=3D1327 audit(1677283528.91=
4:37): proctitle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.263483] docker0: port 1(veth4dc9000) entered d=
isabled state<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.298263] device veth4dc9000 left promiscuous mo=
de<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.298305] docker0: port 1(veth4dc9000) entered d=
isabled state<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; [ 1359.298646] audit: type=3D1700 audit(1677283529.16=
4:38): dev=3Dveth4dc9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 =
gid=3D0 ses=3D4294967295<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; docker: Error response from daemon: failed to create =
shim task: OCI runtime create failed: runc create failed: unable to start c=
ontainer process: can&#39;t get final child&#39;s PID from pipe: EOF: unkno=
wn.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; ERRO[0000] error waiting for container: context cance=
led<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Also sending the local.conf and bblayers.conf file<br=
>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; local.conf:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; MACHINE ??=3D &#39;imx8mpevk&#39;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; DISTRO ?=3D &#39;fsl-imx-wayland&#39;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; PACKAGE_CLASSES ?=3D &#39;package_rpm&#39;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; EXTRA_IMAGE_FEATURES ?=3D &quot;debug-tweaks&quot;<br=
>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; USER_CLASSES ?=3D &quot;buildstats&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; PATCHRESOLVE =3D &quot;noop&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BB_DISKMON_DIRS ??=3D &quot;\<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 STOPTASKS,${TMPDIR},1G,100K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 STOPTASKS,${DL_DIR},1G,100K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 STOPTASKS,${SSTATE_DIR},1G,100K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0STOPTASKS,/tmp,100M,100K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 HALT,${TMPDIR},100M,1K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 HALT,${DL_DIR},100M,1K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 HALT,${SSTATE_DIR},100M,1K \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 HALT,/tmp,10M,1K&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; PACKAGECONFIG:append:pn-qemu-system-native =3D &quot;=
 sdl&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; CONF_VERSION =3D &quot;2&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; DL_DIR ?=3D &quot;${BSPDIR}/downloads/&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; ACCEPT_FSL_EULA =3D &quot;1&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; # Switch to Debian packaging and include package-mana=
gement in the image<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; PACKAGE_CLASSES =3D &quot;package_deb&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; EXTRA_IMAGE_FEATURES +=3D &quot;package-management&qu=
ot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; DISTRO_FEATURES:append =3D &quot; virtualization&quot=
;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; IMAGE_INSTALL:append =3D &quot; docker-ce&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; IMAGE_INSTALL:append =3D &quot; kernel-modules&quot;<=
br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; EXTRA_IMAGE_FEATURES =3D &quot;debug-tweaks tools-pro=
file&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; bblayers.conf<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; LCONF_VERSION =3D &quot;7&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getV=
ar(&#39;FILE&#39;, True)) + &#39;/../..&#39;)}<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBFILES ?=3D &quot;&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS =3D &quot; \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/poky/meta \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/poky/meta-poky \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-oe \<b=
r>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-multim=
edia \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-openembedded/meta-python=
 \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-freescale \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-freescale-3rdparty \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 ${BSPDIR}/sources/meta-freescale-distro \<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; &quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; # i.MX Yocto Project Release layers<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-b=
sp&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-s=
dk&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-m=
l&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-imx/meta-v=
2x&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; #BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-nxp-demo-=
experience&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; #BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-browser/m=
eta-chromium&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; #BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-clang&quo=
t;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; #BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembed=
ded/meta-gnome&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedd=
ed/meta-networking&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-openembedd=
ed/meta-filesystems&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-virtualiza=
tion&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-teledyne-w=
apng&quot;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-aws&quot;<=
br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Regards<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Simon<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY &lt;<a=
 href=3D"mailto:simonkbaby@gmail.com" target=3D"_blank">simonkbaby@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Hello Team,<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Can I know what are the changes required in y=
octo to run docker and its dependencies=C2=A0 on my target embedded system.=
 I have added the below changes. Do I need more plugins and packages ?<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; bblayers.conf:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-op=
enembedded/meta-networking&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-op=
enembedded/meta-filesystems&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; BBLAYERS +=3D &quot;${BSPDIR}/sources/meta-vi=
rtualization&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; local.conf:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DISTRO_FEATURES:append =3D &quot; virtualizat=
ion&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; IMAGE_INSTALL:append =3D &quot; docker-ce&quo=
t;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; You likely are missing kernel configuration value=
s required to run the<br>
&gt;&gt; &gt;&gt;&gt;&gt; containers.<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; What kernel are you using (linux-yocto?), and are=
 you on the master<br>
&gt;&gt; &gt;&gt;&gt;&gt; branch of the layers ?<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; As you can see, it is working in my latest tests:=
<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; root@qemux86-64:~# docker --version<br>
&gt;&gt; &gt;&gt;&gt;&gt; Docker version 23.0.1, build a5ee5b1dfc<br>
&gt;&gt; &gt;&gt;&gt;&gt; root@qemux86-64:~# docker pull alpine<br>
&gt;&gt; &gt;&gt;&gt;&gt; Using default tag: latest<br>
&gt;&gt; &gt;&gt;&gt;&gt; latest: Pulling from library/alpine<br>
&gt;&gt; &gt;&gt;&gt;&gt; 63b65145d645: Pull complete<br>
&gt;&gt; &gt;&gt;&gt;&gt; Digest: sha256:69665d02cb32192e52e07644d76bc6f25a=
beb5410edc1c7a81a10ba3f0efb90a<br>
&gt;&gt; &gt;&gt;&gt;&gt; Status: Downloaded newer image for alpine:latest<=
br>
&gt;&gt; &gt;&gt;&gt;&gt; <a href=3D"http://docker.io/library/alpine:latest=
" rel=3D"noreferrer" target=3D"_blank">docker.io/library/alpine:latest</a><=
br>
&gt;&gt; &gt;&gt;&gt;&gt; root@qemux86-64:~# docker run -it alpine /bin/sh<=
br>
&gt;&gt; &gt;&gt;&gt;&gt; / #<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Try adding &quot;kernel-modules&quot; to your IMA=
GE_INSTALL, and see if that<br>
&gt;&gt; &gt;&gt;&gt;&gt; makes a difference.<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; Bruce<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; WIth the above changes and tested on the targ=
et I am getting the below error when try to run &quot;docker run hello-worl=
d&quot;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; root@imx8mpevk:~# docker run hello-world<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.064704083Z] Calling =
HEAD /_ping<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.068355788Z] Calling =
POST /v1.41/containers/create<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.069098805Z] form dat=
a: {=E2=80=9CAttachStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false=
,=E2=80=9CAttachStdout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDo=
mainname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=
=80=9CEnv=E2=80=9D:null,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=
=E2=80=9D:false,=E2=80=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=
=80=9D:null,=E2=80=9CBlkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDevice=
WriteBps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=
=9CBlkioWeight=E2=80=9D:0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCap=
Add=E2=80=9D:null,=E2=80=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CCgroupnsMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[=
0,0],=E2=80=9CContainerIDFile=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=
=E2=80=9D:0,=E2=80=9CCpuPercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=
=E2=80=9CCpuQuota=E2=80=9D:0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=
=9CCpuRealtimeRuntime=E2=80=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpu=
setCpus=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CDeviceCgroupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=
=E2=80=9D:null,=E2=80=9CDevices=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CD=
nsOptions=E2=80=9D:,=E2=80=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=
=9D:null,=E2=80=9CGroupAdd=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=
=9D:0,=E2=80=9CIOMaximumIOps=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CIsolation=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMem=
ory=E2=80=9D:0,=E2=80=9CKernelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:=
null,=E2=80=9CLogConfig=E2=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=
=E2=80=9D:=E2=80=9C=E2=80=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CM=
emory=E2=80=9D:0,=E2=80=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=
=E2=80=9D:0,=E2=80=9CMemorySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=
=9D:0,=E2=80=9CNetworkMode=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomK=
illDisable=E2=80=9D:false,=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=
=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBin=
dings=E2=80=9D:{},=E2=80=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPor=
ts=E2=80=9D:false,=E2=80=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRoo=
tfs=E2=80=9D:false,=E2=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCo=
unt=E2=80=9D:0,=E2=80=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecuri=
tyOpt=E2=80=9D:null,=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=
=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CVolumesFrom=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=
=80=9D,=E2=80=9CImage=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabel=
s=E2=80=9D:{},=E2=80=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=
=E2=80=9D:{}},=E2=80=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:fa=
lse,=E2=80=9CPlatform=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=
=80=9CTty=E2=80=9D:false,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CVolumes=E2=80=9D:{},=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[25846.680992] docker0: port 1(veth659d26=
7) entered blocking state<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; [25846.681041] docker0: port 1(veth659d267) e=
ntered disabled state<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; [2023-02-23T00:53:57.121358454Z] [25846.68131=
2] device veth659d267 entered promiscuous mode<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; container mounted via layerStore:[25846.68139=
2] audit: type=3D1700 audit(1677113637.219:205): dev=3Dveth659d267 prom=3D2=
56 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; &amp;{/var/lib/docker/overlay2/d664e[25846.68=
3022] audit: type=3D1300 audit(1677113637.219:205): arch=3Dc00000b7 syscall=
=3D206 success=3Dyes exit=3D40 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=
=3D0 ppid=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 c=
omm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D ke=
y=3D(null)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; 7963d79b51cb1322f9995853ff56f54a3[25846.68309=
1] audit: type=3D1327 audit(1677113637.219:205): proctitle=3D2F7573722F6269=
6E2F646F636B657264002D44<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b=
060 0xaaaabdb0b060} container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633=
864f09a4c9edbdb62d190<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.184741848Z] Calling =
POST /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c=
9edbdb62d190/attach?stderr=3D1&amp;stdout=3D1&amp;stream=3D1<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.185112606Z] attach: =
stderr: begin<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.185130357Z] attach: =
stdout: begin<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.186340258Z] Calling =
POST /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c=
9edbdb62d190/wait?condition=3Dnext-exit<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.188347802Z] Calling =
POST /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c=
9edbdb62d190/start<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.190864983Z] containe=
r mounted via layerStore: &amp;{/var/lib/docker/overlay2/d664e7963d79b51cb1=
322f9995853ff56f54a3aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaa=
bdb0b060} container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9=
edbdb62d190<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.191993758Z] Assignin=
g addresses for endpoint crazy_bell=E2=80=99s interface on network bridge<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.192083760Z] RequestA=
ddress(LocalDefault/<a href=3D"http://172.17.0.0/16" rel=3D"noreferrer" tar=
get=3D"_blank">172.17.0.0/16</a>, , map)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.192149761Z] Request =
address PoolID:<a href=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=
=3D"_blank">172.17.0.0/16</a> App: ipam/default/data, ID: LocalDefault/<a h=
ref=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">172.17.0.=
0/16</a>, DBIndex: 0x0, Bits: 65536, Unselected: 65533, Sequence: (0xc00000=
00, 1)-&gt;(0x0, 2046)-&gt;(0x1, 1)-&gt;end Curr:3 Serial:false PrefAddress=
:<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.192262764Z] failed t=
o set to initial namespace, readlink /proc/1551/task/1555/ns/net: no such f=
ile or directory, initns fd -1: bad file descriptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.252893597Z] Assignin=
g addresses for endpoint crazy_bell=E2=80=99s interface on network bridge<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.274329693Z] failed t=
o set to initial namespace, readlink /proc/1551/task/1555/ns/net: no such f=
ile or directory, initns fd -1: bad file descriptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.294111754Z] Programm=
ing external connectivity on endpoint crazy_bell (1a86f3778b61204dcc7106bed=
28728a001028ba51f5c5fe731042007ec0ebd3c)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.299150489Z] failed [=
25846.962844] docker0: port 1(veth659d267) entered disabled state<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; to set to initial namespace, readlink /proc/1=
551/task/1555/ns/net: no such file or directory, initns fd -1: bad file des=
criptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.304933242Z] EnableSe=
rvice 4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 STAR=
T<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25=
846.996647] device veth659d267 left promiscuous mode<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; eService 4f926f032e0566c4dbdfbb02[25846.99668=
6] docker0: port 1(veth659d267) entered disabled state<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; [25846.996703] audit: type=3D1700 audit(16771=
13637.488:206): dev=3Dveth659d267 prom=3D0 old_prom=3D256 auid=3D4294967295=
 uid=3D0 gid=3D0 ses=3D4294967295<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE=
<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.313909564Z] bundle d=
ir created bundle=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787=
b42e6e19ef[25847.040986] audit: type=3D1300 audit(1677113637.488:206): arch=
=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=
=3D20 a3=3D0 items=3D0 ppid=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=
=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 =
ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/d=
ockerd=E2=80=9D key=3D(null)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; [25847.041004] audit: type=3D1327 audit(16771=
13637.488:206): proctitle=3D2F7573722F62696E2F646F636B657264002D44<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; 6e633864f09a4c9edbdb62d190 module=3Dlibcontai=
nerd namespace=3Dmoby root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322=
f9995853ff56f54a3aa2994ae5b99b3bcb65c33ec2f/merged<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.445101824Z] stream c=
opy error: reading from a closed fifo<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.445126200Z] stream c=
opy error: reading from a closed fifo<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.445172451Z] attach: =
stderr: end<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.445174576Z] attach: =
stdout: end<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.445349705Z] attach d=
one<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.469084602Z] Revoking=
 external connectivity on endpoint crazy_bell (1a86f3778b61204dcc7106bed287=
28a001028ba51f5c5fe731042007ec0ebd3c)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.469206980Z] failed t=
o set to initial namespace, readlink /proc/1551/task/1558/ns/net: no such f=
ile or directory, initns fd -1: bad file descriptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.475388115Z] failed t=
o set to initial namespace, readlink /proc/1551/task/1558/ns/net: no such f=
ile or directory, initns fd -1: bad file descriptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.489002290Z] failed t=
o set to initial namespace, readlink /proc/1551/task/1558/ns/net: no such f=
ile or directory, initns fd -1: bad file descriptor<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.587904715Z] Releasin=
g addresses for endpoint crazy_bell=E2=80=99s interface on network bridge<b=
r>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.610361084Z] ReleaseA=
ddress(LocalDefault/<a href=3D"http://172.17.0.0/16" rel=3D"noreferrer" tar=
get=3D"_blank">172.17.0.0/16</a>, 172.17.0.2)<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; DEBU[2023-02-23T00:53:57.619890544Z] Released=
 address PoolID:LocalDefault/<a href=3D"http://172.17.0.0/16" rel=3D"norefe=
rrer" target=3D"_blank">172.17.0.0/16</a>, Address:172.17.0.2 Sequence:App:=
 ipam/default/data, ID: LocalDefault/<a href=3D"http://172.17.0.0/16" rel=
=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>, DBIndex: 0x0, Bits: 65=
536, Unselected: 65532, Sequence: (0xe0000000, 1)-&gt;(0x0, 2046)-&gt;(0x1,=
 1)-&gt;end Curr:3<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.659608292Z] 4f926f03=
2e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to=
 delete container from containerd: no such container<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[2023-02-23T00:53:57.659718420Z] Handler =
for POST /v1.41/containers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f0=
9a4c9edbdb62d190/start returned error: failed to create shim task: OCI runt=
ime create failed: runc create failed: unable to start container process: c=
an=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; docker: Error response from daemon: failed to=
 create shim task: OCI runtime create failed: runc create failed: unable to=
 start container process: can=E2=80=99t get final child=E2=80=99s PID from =
pipe: EOF: unknown.<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; ERRO[0000] error waiting for container: conte=
xt canceled<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Regards<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; Simon<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; --<br>
&gt;&gt; &gt;&gt;&gt;&gt; - Thou shalt not follow the NULL pointer, for cha=
os and madness await<br>
&gt;&gt; &gt;&gt;&gt;&gt; thee at its end<br>
&gt;&gt; &gt;&gt;&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star=
 Trek II<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#7902): <a href=3D"https://lists.yoctoproject.o=
rg/g/meta-virtualization/message/7902" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.yoctoproject.org/g/meta-virtualization/message/7902</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/9717=
5886/4946642" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/mt/97175886/4946642</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.y=
octoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopro=
ject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virt=
ualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:simonkbaby@gm=
ail.com" target=3D"_blank">simonkbaby@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000f756b605f5d8bafb--

