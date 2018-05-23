Return-Path: <nicolai.weis@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D334CE009D4; Wed, 23 May 2018 04:20:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE, MIME_HTML_ONLY,
	RCVD_IN_DNSWL_LOW autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nicolai.weis[at]web.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.227.17.12 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98C9DE00791
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 04:19:59 -0700 (PDT)
Received: from [212.121.145.5] ([212.121.145.5]) by
	3c-app-webde-bap48.server.lan (via HTTP);
	Wed, 23 May 2018 13:19:57 +0200
MIME-Version: 1.0
Message-ID: <trinity-1641f8e9-1faa-4cb2-8cc2-99d2377a8751-1527074397717@3c-app-webde-bap48>
From: "Nicolai Weis" <nicolai.weis@web.de>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 May 2018 13:19:57 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
	<CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:MlOdvfy/8B+CxcW4gfYqsJ6uSYDXCSSjLTUI+nlxvR+
	AsaX5+N3DNRlNpgqYOiXkq1Zfnkv0/4/OHFGSSqdiQuBcd4cSm
	nS3TAoAPGGH9NLqwJ3Bzmfk4VzffC7nVEHm/lzrlDYQe7gFQ+H
	ajv+ZZnARwohFdQpAZ9mbsrMyWiQAqPN/k3a1gPARANfgUkegO
	S8gq9JsvrrhVZAFDkQ7IfwjLLaMzuwrO1R9CEhd50hIHhUN0Fy
	8qGOTIphB50TP93Fu52p1WdD4vtMGIl1fVP/g4A1RGUJUUbJZQ hDBzkA=
X-UI-Out-Filterresults: notjunk:1;V01:K0:C+Wa4k3M5QA=:hECjhEaD2W9dzRG1sYAUjd
	f3Jelk1rTb+XbISvh2j4mpHbEgEyu0KSgO9jAAssVI7oNDAye9kxGMi2AuKQPfsDOXeQ7d7I7
	qphz9aFggQIV7EcOG4OCw0y9c36ZCaHjw7qC5NoIDA5wX6CT2LO5jeanVv//5P5j2c7WBCB0t
	GAIiLuueXr6dJuVQeB1IG3DGPvwWJk7/OUiZ7WFGsodZBeP/o+sJEhmmFpklGv5W7o5pNk2AG
	V1cKSZkL0JXiBUKt1kdMtVeoe0mfnQ8ncbA76VY70OyE5de5JxIR9QJkW3Jm0n8Cp8u3DS/Xb
	aEqDcHtg/qh5doJO8gHmqTygcis92zxSE43py75ED5/pvnRIHqzh+td66xCxDPXd5eWZNqckV
	tLSpk6Lb9gT5VaYgvmZt/kkUfUvsDTpeJQSR+EZoWAB+ke6Wmjt2uJyQ0hvJIbXytOsn8cs05
	tt77FzNB4i29iQokTZuv3QpgBOVvRNAOqJ6LMQFxr2sodUyZEo+p
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Question Integration of LXC
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
X-List-Received-Date: Wed, 23 May 2018 11:20:00 -0000
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>
<pre>On Tue, May 22, 2018 at 7:38 AM, Nicolai Weis &lt;<a href="https://lists.yoctoproject.org/listinfo/meta-virtualization">nicolai.weis at web.de</a>&gt; wrote:

&gt;<i> </i>&gt;<i> Hi all,
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> In a project I want to integrate lxc-containers into the
</i>&gt;<i> </i>&gt;<i> core-image-minimal for the minnowboard turbot. Therefore I&#39;m using the
</i>&gt;<i> </i>&gt;<i> krogoth branch (have to use this branch) for the meta-layers.
</i>&gt;<i> </i>&gt;<i> As described in the README-file I add meta-virtualization, meta-oe,
</i>&gt;<i> </i>&gt;<i> meta-networking, meta-filesystems and meta-python to the bblayers.conf. In
</i>&gt;<i> </i>&gt;<i> the local.conf
</i>&gt;<i> </i>&gt;<i> I added at the end of the file BBFILE_PRIORITY_openembedded-layer = &quot;4&quot;
</i>&gt;<i> </i>&gt;<i> and IMAGE_INSTALL_append = &quot; lxc&quot; (lxc_2.0.0.bb).
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> After the sucessful build I start the image and created with the
</i>&gt;<i> </i>&gt;<i> busybox-template - should I use a different template? - a lxc-busybox
</i>&gt;<i> </i>&gt;<i> container. I tried to start the container, but the error
</i>&gt;<i> </i>&gt;<i> &quot;1079 failed initializing cgroup support&quot; appeared. lxc-checkconfig showed
</i>&gt;<i> </i>&gt;<i> cgroup-namespaces: required. I tried to solve this with adding cgroup-lite
</i>&gt;<i> </i>&gt;<i> to IMAGE_INSTALL_append, but it
</i>&gt;<i> </i>&gt;<i> didn&#39;t change anything (only let cgroup-namespaces disappear and showed
</i>&gt;<i> </i>&gt;<i> Cgroup clone_children flag: enabled). I&#39;m using sysvinit instead of systemd.
</i>
<i>
</i>&gt;<i> </i>What kernel are you using ? This typically means that the kernel config
&gt;<i> </i>isn&#39;t correct.
&gt;<i> </i>If you aren&#39;t using linux-yocto, then the fragments we have in the layer
&gt;<i> </i>are likely
&gt;<i> </i>not being applied, and you&#39;ll need to manually configure your kernel with
&gt;<i> </i>the right
&gt;<i> </i>options.

In the minnowboard image I&#39;m using the kernel version 4.4.26-rt19-yocto-preempt-rt.
I tried it with a qemux image with the kernel version 4.4.26-yocto-standard, too. 

&gt;<i> </i>Otherwise, it could be that the cgroups are not being mounted properly by
&gt;<i> </i>your
&gt;<i> </i>recipe, so have a look and confirm if cgroups or cgroups2 are in fact
&gt;<i> </i>mounted in
&gt;<i> </i>your image.

I did the mounting with the cgroups-mount script under the /bin directory (comming through adding cgroups-lite to the image). Inside /sys/fs/cgroup directory
there are the mounted folders with blkio, cpu, cpuacct, cpuset, debug, devices, freezer, memory and net_cls. Furthermore I checked it with a cgroups_check-config.sh from docker.
The output showed following missing configs, but I don&#39;t think they are the reason that the lxc-busybox container doesn&#39;t start:
- Generally necessary - missing: CONFIG_VETH, CONFIG_IP_NF_TARGET_<wbr/>MASQUERADE, CONFIG_NETFILTER_XT_MATCH_<wbr/>ADDRTYPE, CONFIG_NETFILTER_XT_MATCH_<wbr/>IPVS, CONFIG_IP_NF_NAT,
&nbsp;&nbsp; CONFIG_DEVPTS_MULTIPLE_<wbr/>INSTANCES
- Optional Features - missing: CONFIG_CGROUP_PIDS, CONFIG_BLK_DEV_THROTTLING, CONFIG_CFQ_GROUP_IOSCHED, CONFIG_CGROUP_PERF, CONFIG_CGROUP_HUGETLB, CONFIG_CGROUP_NET_PRIO,
&nbsp; CONFIG_CFS_BANDWIDTH, CONFIG_RT_GROUP_SCHED, CONFIG_IP_VS, CONFIG_IP_VS_NFCT, CONFIG_IP_VS_RR

With lxc-start -n Test -F it showed that start.c: 1079 failed initializing cgroup support comes after cgfsng.c: 431 no systemd controller mountpoint found. If I try to mount systemd (I&#39;m using sysvinit and so mounting systemd makes no sense to me) there are a lot of other failures. 

&gt;<i> </i>Bruce


&gt;<i> </i>&gt;<i> Do I have to change some configurations in the lxc-recipe? I would be very
</i>&gt;<i> </i>&gt;<i> grateful if you can give me some information about it.
</i>&gt;<i> </i>&gt;<i>
</i>&gt;<i> </i>&gt;<i> Thanks
</i>&gt;<i> </i>&gt;<i> Nicolai</i></pre>
</div>
</div></div></body></html>

