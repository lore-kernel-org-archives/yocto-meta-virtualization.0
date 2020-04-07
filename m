Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web12.10667.1586271466459412445
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 07:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: eloi.bail@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 84B689C0499
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  7 Apr 2020 10:57:45 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id OefGF6tOE9pD; Tue,  7 Apr 2020 10:57:44 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B0CCE9C0529;
	Tue,  7 Apr 2020 10:57:44 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GUFZ1TRsV3pR; Tue,  7 Apr 2020 10:57:44 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7AC159C0499;
	Tue,  7 Apr 2020 10:57:44 -0400 (EDT)
Date: Tue, 7 Apr 2020 10:57:44 -0400 (EDT)
From: =?UTF-8?B?w4lsb2kgQmFpbA==?= <eloi.bail@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Message-ID: <1728619179.807474.1586271464336.JavaMail.zimbra@savoirfairelinux.com>
Subject: Openvswitch 2.13 and python3
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - FF74 (Linux)/8.8.11_GA_3737)
Thread-Index: WkzRYLvS7Q2lqVrobgcVTRNy7HABfw==
Thread-Topic: Openvswitch 2.13 and python3
Content-Type: multipart/alternative; 
	boundary="=_c9b4a3da-afbe-48d6-82af-c43dcda5af37"

--=_c9b4a3da-afbe-48d6-82af-c43dcda5af37
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi guys, 

I am integrating ovs/dpdk on Yocto Zeus. 
As I am using a custom Linux Kernel 4.19, I can't use ovs 2.11 and used the mainline version. 

FYI I struggled with EXTRA_OECONF to point to my Linux Kernel as mentionned in [ http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-networking/openvswitch/openvswitch.inc?h=master#n45 | Openvswitch recipe ] . 
EXTRA_OECONF_append_pn-openvswitch needs to be used in distro instead of EXTRA_OECONF_pn-openvswitch += 

Now my ovs/dpdk is correctly installed on my Yocto image. 

However, ovs utilities seem to have wrong shebang (#! python3). The shebang is based on PYTHON3 variable. For instance: [ https://github.com/openvswitch/ovs/blob/master/utilities/ovs-test.in#L1 | https://github.com/openvswitch/ovs/blob/master/utilities/ovs-test.in#L1 ] 
PYTHON3 variable is provided in EXTRA_OECONF from openvswitch.inc: 
EXTRA_OECONF += "\
	PYTHON=python3 \
	PYTHON3=python3 \
	PERL=${bindir}/perl \
	" 

Did you encounter this issue ? 

Also, OVS utilities - including test tools - still use python2 syntax but Openvswitch recipe RDEPEND on python3 only. I don't know if it is a known issue. 
I know that some recent work on python3 migration was done by ovs team but AFAIK, utilities scripts would require some work. 
I will give a try to migrate those scripts with [ https://docs.python.org/3.8/library/2to3.html | 2to3 ] tool. 

Please do not hesitate to contact me if you need some clarification. 

BR, 

Eloi 



--=_c9b4a3da-afbe-48d6-82af-c43dcda5af37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div>Hi guys,<br data-mce-bogus=3D"1"></div><div=
><br data-mce-bogus=3D"1"></div><div>I am integrating ovs/dpdk on Yocto Zeu=
s.<br data-mce-bogus=3D"1"></div><div>As I am using a custom Linux Kernel 4=
.19, I can't use ovs 2.11 and used the mainline version.<br data-mce-bogus=
=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>FYI I struggled with =
EXTRA_OECONF to point to my Linux Kernel as mentionned in <a data-mce-href=
=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/reci=
pes-networking/openvswitch/openvswitch.inc?h=3Dmaster#n45" href=3D"http://g=
it.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-networki=
ng/openvswitch/openvswitch.inc?h=3Dmaster#n45">Openvswitch recipe</a>.<br d=
ata-mce-bogus=3D"1"></div><div><em>EXTRA_OECONF_append_pn-openvswitch</em>&=
nbsp; needs to be used in distro instead of <em>EXTRA_OECONF_pn-openvswitch=
 +=3D </em><br data-mce-bogus=3D"1"></div><div><em><br data-mce-bogus=3D"1"=
></em></div><div>Now my ovs/dpdk is correctly installed on my Yocto image.<=
br></div><div><br data-mce-bogus=3D"1"></div><div>However, ovs utilities se=
em to have wrong shebang (#! python3). The shebang is based on PYTHON3 vari=
able. For instance: <a href=3D"https://github.com/openvswitch/ovs/blob/mast=
er/utilities/ovs-test.in#L1">https://github.com/openvswitch/ovs/blob/master=
/utilities/ovs-test.in#L1</a><br data-mce-bogus=3D"1"></div><div>PYTHON3 va=
riable is provided in EXTRA_OECONF from openvswitch.inc:<br data-mce-bogus=
=3D"1"></div><div><pre><code>EXTRA_OECONF +=3D "\
=09PYTHON=3Dpython3 \
=09PYTHON3=3Dpython3 \
=09PERL=3D${bindir}/perl \
=09"</code><br><br><span style=3D"font-family: arial, helvetica, sans-serif=
;" data-mce-style=3D"font-family: arial, helvetica, sans-serif;">Did you en=
counter this issue ?<br><br>Also, OVS utilities - including test tools - st=
ill use python2 syntax but Openvswitch recipe RDEPEND on python3 only. I do=
n't know if it is a known issue.<br>I know that some recent work on python3=
 migration was done by ovs team but AFAIK, utilities scripts would require =
some work.<br>I will give a try to migrate those scripts with <a data-mce-h=
ref=3D"https://docs.python.org/3.8/library/2to3.html" href=3D"https://docs.=
python.org/3.8/library/2to3.html">2to3</a> tool.<br><br>Please do not hesit=
ate to contact me if you need some clarification.<br><br>BR,<br><br>Eloi  <=
br><br> </span><br></pre></div></div></body></html>

--=_c9b4a3da-afbe-48d6-82af-c43dcda5af37--
