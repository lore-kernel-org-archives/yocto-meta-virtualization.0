Return-Path: <nicolai.weis@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C882E00B5C; Tue, 29 May 2018 05:38:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE,MIME_HTML_ONLY,RCVD_IN_DNSWL_LOW,TO_NO_BRKTS_HTML_ONLY
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nicolai.weis[at]web.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.227.17.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
	*  1.4 TO_NO_BRKTS_HTML_ONLY To: lacks brackets and HTML only
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07D79E00B57
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 05:38:12 -0700 (PDT)
Received: from [212.121.145.5] ([212.121.145.5]) by
	3c-app-webde-bap21.server.lan (via HTTP);
	Tue, 29 May 2018 14:38:05 +0200
MIME-Version: 1.0
Message-ID: <trinity-375847ef-5d15-4d33-ba70-a4dd5a8ac85f-1527597485908@3c-app-webde-bap21>
From: "Nicolai Weis" <nicolai.weis@web.de>
To: mark.asselstine@windriver.com
Date: Tue, 29 May 2018 14:38:05 +0200
Importance: normal
Sensitivity: Normal
References: <trinity-a3db492f-8222-4da7-866b-d0290300a2c4-1526989134941@3c-app-webde-bap43>
	<CADkTA4OsWJoD5X9DuRZjoYA4aAAQ_qdT0WJSnKoTZGK83ojrQw@mail.gmail.com>
	<trinity-1641f8e9-1faa-4cb2-8cc2-99d2377a8751-1527074397717@3c-app-webde-bap48>
	<CADkTA4MqER7xi56ab-SVnC1AEfXA4pABLT-Pksj1U792CY6ajg@mail.gmail.com>
	<CAPuovEK-2tb_7aimb7YXL8Q7H=NWJDSd5FdWn97A80eBOUkSAw@mail.gmail.com>
	<CAPuovEKMXPTVHp=4WkCRsk2Au_EC6HJh-8ESg=EMYdM3GhxuHQ@mail.gmail.com>
	<trinity-ff36e0fa-466b-4d34-936f-97b6a19f73bb-1527597250966@3c-app-webde-bap21>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:l7sE7Emp8YTquKhtOkzA/bNiS25tniMp+2zt26mlZoW
	CqU0rgaWwJqATJOLPU5qqkfgSk4u6VRbVCOjzyvQPJxzXUfCY+
	BibOuLsqYqeDGsCnkQ2f9CPWLGNYQCobqLdWX3ZSuI2oqubZYJ
	SWgQy7p7E4aFP+30velCCBXuT4y9o1saFI3TBfvV4aplkLx0xQ
	T1hRvr2lLRpj1RDVMoZO81mAf+GwaFehYF/llbwfiYQZ1XeZy/
	3i3zeXVPgEh0u51hrfpjxXQ9Vyr9WxBqEiSS/F0DsI2YNeiyy0 op7wUQ=
X-UI-Out-Filterresults: notjunk:1;V01:K0:gpmo33YbMLw=:31eXhoL1Kl7B312OkvFKQR
	Rg8EUNXE8R3VLzYNrUTKoXq1P99XrjswJn/FgD9QqsCtFL/PhOLiuIxuGga4++sd7tY6gxALs
	eUUYie9wOkW+RBsde3R46Ma6Lx39ianB1IuT886Ws6302DIFp8q1G4lilrZXqBdrx9fgpNuTr
	/HcgbgJjABNsKh3mqjKACmGGhHiU4e3xnjHFrZmEDsb3wuwsCVcoPi/raozYkSuHNMgExZuvy
	IXPZjUcwr1JO3elWgAUqQC7YSV0Mg7+b2EWPNqqVoE3oRq2P2kY70zyCyzKwB68Ww/Ic8dVrH
	l3HHvcs1ICtZD9g/wdor/QfxFbZSvlaqFTtpFIvLxqGcpPmL5PKNLTm/dGSLP2RrjhFDxl++t
	LHO84W7QyByNlm8BwIN6DAVE9HLqXuSSqb49N0stgNUsYppA+43wOGjWKs1mrjM8V89BCVE/L
	eFVm4dztWqZiOWOnd8QXKXWDGO96QUT5X1vOcFoS0OE30uAxhv4r
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
X-List-Received-Date: Tue, 29 May 2018 12:38:14 -0000
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div><span class="im">&gt;&gt; I actually had a cgroup-lite uprev in flight which has now been sent<br/>
&gt;&gt; to the list. I also have plans to uprev LXC in the next week or so,<br/>
&gt;&gt; along with making some changes, such as dropping the lxc-setup package<br/>
&gt;&gt; which has its roots from early iterations of the systemd/sysvinit<br/>
&gt;&gt; split, which can be done differently now. If I find the time to get<br/>
&gt;&gt; this done you should see the series soon.</span></div>

<div><span class="im">&nbsp;</span></div>

<div>The uprev cgroup-lite works fine. Now I don&#39;t have to mount systemd manually. Thank you for that.</div>

<div><span class="im">&nbsp;</span></div>

<div><span class="im">&gt; Just to follow up on this. With the cgroup-lite change sent and merged yesterday<br/>
&gt; I am able to create and run a container using the lxc busybox template.</span></div>

<div><br/>
<span class="im">&gt; I needed to update the template to &#39;binary_copy passwd&#39; and adjust the<br/>
&gt; &#39;chmod&#39; path for this from &#39;/bin/passwd&#39; to &#39;/usr/bin/passwd&#39;.</span></div>

<div><span class="im">&nbsp;</span></div>

<div>How do you change the lxc-busybox-template exactly? What code do I have to change into binary_copy passwd?<br/>
Do you mean the chmod path in the function configure_busybox() { ... # passwd exec must be setuid<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<wbr/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; chmod +s &#36;rootfs/bin/passwd ...} ?</div>

<div><span class="im">&nbsp;</span></div>

<div><span class="im">&gt; Along with manually tweaking the memory cgroup (via &#39;echo 1 &gt; /sys/fs/cgroup/memory/memory.<wbr/>use_hierarchy).</span></div>

<div><span class="im">&nbsp;</span></div>

<div>In my case this isn&#39;t possible: write error: Device or resource busy.</div>

<div><br/>
<span class="im">&gt; I will not consider<br/>
&gt; digging in to fix these until I confirm they are still an issue after<br/>
&gt; the LXC uprev.<br/>
<br/>
&gt; The following are the only changes to my local.conf<br/>
&gt; ---<br/>
&gt; MACHINE = &quot;qemux86-64&quot;<br/>
&gt; DISTRO_FEATURES += &quot;virtualization&quot;<br/>
&gt; PACKAGE_CLASSES = &quot;package_ipk&quot;<br/>
&gt; IMAGE_INSTALL_append += &quot;cgroup-lite lxc&quot;<br/>
&gt; ---</span></div>

<div><span class="im">&nbsp;</span></div>

<div>I got it working on the machine = &quot;qemux86&quot;, too (Krogoth). I needed to add under meta-virtualization/recipes-<wbr/>core/busybox a new<br/>
Config-file with &quot;CONFIG_INIT=y&quot; in it.&nbsp; I can&#39;t access the running container with lxc-console,&nbsp; but with lxc-attach it works fine.</div>

<div><br/>
In my minnowboard image (machine = &quot;intel-corei7-64&quot; modified with PREFERRED_PROVIDER_virtual/<wbr/>kernel = &quot;linux-yocto-rt&quot; and&nbsp;MACHINE_EXTRA_RRECOMMENDS += &quot;kernel-modules&quot;)<br/>
this isn&#39;t enough. I got the error:</div>

<div>&nbsp; [12208.261387] devpts: called with bogus options<br/>
&nbsp; lxc-start: conf.c: lxc_create_tty: 3284 No such file or directory - failed to create pty #0<br/>
&nbsp; lxc-start: conf.c: lxc_setup: 3800 failed to create the ttys</div>

<div>&nbsp; lxc-start: start.c: do_start: 819 failed to setup the container<br/>
&nbsp; lxc-start: sync.c: __sync_wait: 52 An error occurred in another process (expected sequence number 2)</div>

<div><br/>
Any ideas?<br/>
In lxc-checkconfig there is Multiple /dev/pts instances: missing (in qemux it is enabled). CONFIG_DEVPTS_MULTIPLE_<wbr/>INSTANCES=y is always set.</div>
</div></div></body></html>

