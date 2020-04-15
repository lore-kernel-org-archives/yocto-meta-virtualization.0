Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.9616.1586933161261215797
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 23:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: eloi.bail@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2C4849C02A7;
	Wed, 15 Apr 2020 02:46:00 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QxIXH6Ryv3pR; Wed, 15 Apr 2020 02:45:59 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5681A9C0406;
	Wed, 15 Apr 2020 02:45:59 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JoM1B9mXl5fh; Wed, 15 Apr 2020 02:45:59 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2CABE9C02A7;
	Wed, 15 Apr 2020 02:45:59 -0400 (EDT)
Date: Wed, 15 Apr 2020 02:45:57 -0400 (EDT)
From: =?UTF-8?B?w4lsb2kgQmFpbA==?= <eloi.bail@savoirfairelinux.com>
To: mark asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Message-ID: <607097091.1083838.1586933157275.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <CAPuovEKCBbp5a58z4S80VN3HNLbz_jMNwKdVLoCs=FJurSaypQ@mail.gmail.com>
References: <1728619179.807474.1586271464336.JavaMail.zimbra@savoirfairelinux.com> <CAPuovEKCBbp5a58z4S80VN3HNLbz_jMNwKdVLoCs=FJurSaypQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Openvswitch 2.13 and python3
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - FF75 (Linux)/8.8.11_GA_3737)
Thread-Topic: Openvswitch 2.13 and python3
Thread-Index: JBWNBe/U8iibvSYJojZR7WCxnriN0Q==
Content-Type: multipart/alternative; 
	boundary="=_2284a4c4-b46d-40e4-a6b7-e3053933690b"

--=_2284a4c4-b46d-40e4-a6b7-e3053933690b
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Tue, Apr 7, 2020 at 10:57 AM =C3=89loi Bail
> <eloi.bail@savoirfairelinux.com> wrote:

> > Hi guys,

> > I am integrating ovs/dpdk on Yocto Zeus.
>> As I am using a custom Linux Kernel 4.19, I can't use ovs 2.11 and used =
the
> > mainline version.

>> FYI I struggled with EXTRA_OECONF to point to my Linux Kernel as mention=
ned in
> > Openvswitch recipe.
>> EXTRA_OECONF_append_pn-openvswitch needs to be used in distro instead of
> > EXTRA_OECONF_pn-openvswitch +=3D

> > Now my ovs/dpdk is correctly installed on my Yocto image.

>> However, ovs utilities seem to have wrong shebang (#! python3). The sheb=
ang is
>> based on PYTHON3 variable. For instance:
> > https://github.com/openvswitch/ovs/blob/master/utilities/ovs-test.in#L1
> > PYTHON3 variable is provided in EXTRA_OECONF from openvswitch.inc:

> > EXTRA_OECONF +=3D "\
> > PYTHON=3Dpython3 \
> > PYTHON3=3Dpython3 \
> > PERL=3D${bindir}/perl \
> > "

> > Did you encounter this issue ?

>> Also, OVS utilities - including test tools - still use python2 syntax bu=
t
>> Openvswitch recipe RDEPEND on python3 only. I don't know if it is a know=
n
> > issue.
>> I know that some recent work on python3 migration was done by ovs team b=
ut
> > AFAIK, utilities scripts would require some work.
> > I will give a try to migrate those scripts with 2to3 tool.

> We switched to use Python3 exclusively with OVS for quite a while now.
> With the Yocto Project being mostly used in embedded environments size
> was the driving factor, having py2 and py3 present was not desirable.
> With Python2 being EOL'd at this point I suspect the upstream OVS
> community will soon remove any traces of python2 from the project.
> There is no value in spending any time on py2 with OVS at this point.
> The package will build and operate just fine as it is.

> Mark
Hi Mark,=20

I can't disagree with that. Python2 must be dropped ! The work needs to be =
done on OVS side.=20
I was just wondering if you were aware of the limitations regarding the usa=
ge=20
of python2 OVS test tools and if you had any feedback from OVS team.=20

However, I believe that the shebang issue (set to #! python3) should be res=
olved in meta-virtualization.=20
Did you also see this issue ?=20

Eloi=20

--=_2284a4c4-b46d-40e4-a6b7-e3053933690b
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div><br data-mce-bogus=3D"1"></div><div data-ma=
rker=3D"__QUOTED_TEXT__"><blockquote style=3D"border-left:2px solid #1010FF=
;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:=
normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-siz=
e:12pt;">On Tue, Apr 7, 2020 at 10:57 AM =C3=89loi Bail<br>&lt;eloi.bail@sa=
voirfairelinux.com&gt; wrote:<br>&gt;<br>&gt; Hi guys,<br>&gt;<br>&gt; I am=
 integrating ovs/dpdk on Yocto Zeus.<br>&gt; As I am using a custom Linux K=
ernel 4.19, I can't use ovs 2.11 and used the mainline version.<br>&gt;<br>=
&gt; FYI I struggled with EXTRA_OECONF to point to my Linux Kernel as menti=
onned in Openvswitch recipe.<br>&gt; EXTRA_OECONF_append_pn-openvswitch &nb=
sp;needs to be used in distro instead of EXTRA_OECONF_pn-openvswitch +=3D<b=
r>&gt;<br>&gt; Now my ovs/dpdk is correctly installed on my Yocto image.<br=
>&gt;<br>&gt; However, ovs utilities seem to have wrong shebang (#! python3=
). The shebang is based on PYTHON3 variable. For instance: https://github.c=
om/openvswitch/ovs/blob/master/utilities/ovs-test.in#L1<br>&gt; PYTHON3 var=
iable is provided in EXTRA_OECONF from openvswitch.inc:<br>&gt;<br>&gt; EXT=
RA_OECONF +=3D "\<br>&gt; PYTHON=3Dpython3 \<br>&gt; PYTHON3=3Dpython3 \<br=
>&gt; PERL=3D${bindir}/perl \<br>&gt; "<br>&gt;<br>&gt; Did you encounter t=
his issue ?<br>&gt;<br>&gt; Also, OVS utilities - including test tools - st=
ill use python2 syntax but Openvswitch recipe RDEPEND on python3 only. I do=
n't know if it is a known issue.<br>&gt; I know that some recent work on py=
thon3 migration was done by ovs team but AFAIK, utilities scripts would req=
uire some work.<br>&gt; I will give a try to migrate those scripts with 2to=
3 tool.<br><br>We switched to use Python3 exclusively with OVS for quite a =
while now.<br>With the Yocto Project being mostly used in embedded environm=
ents size<br>was the driving factor, having py2 and py3 present was not des=
irable.<br>With Python2 being EOL'd at this point I suspect the upstream OV=
S<br>community will soon remove any traces of python2 from the project.<br>=
There is no value in spending any time on py2 with OVS at this point.<br>Th=
e package will build and operate just fine as it is.<br><br>Mark</blockquot=
e><div><br></div><div>Hi Mark,<br data-mce-bogus=3D"1"></div><div><br data-=
mce-bogus=3D"1"></div><div>I can't disagree with that. Python2 must be drop=
ped ! The work needs to be done on OVS side. </div><div>I was just wonderin=
g if you were aware of the limitations regarding the usage</div><div>of pyt=
hon2 OVS test tools and if you had any feedback from OVS team.<br data-mce-=
bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>However, I belie=
ve that the shebang issue (set to #! python3) should be resolved in meta-vi=
rtualization.<br data-mce-bogus=3D"1"></div><div>Did you also see this issu=
e ?<br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><div>=
Eloi<br data-mce-bogus=3D"1"></div><div><br data-mce-bogus=3D"1"></div><blo=
ckquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left=
:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:none;f=
ont-family:Helvetica,Arial,sans-serif;font-size:12pt;"><br><br></blockquote=
></div></div></body></html>

--=_2284a4c4-b46d-40e4-a6b7-e3053933690b--
