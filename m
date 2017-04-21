Return-Path: <max.malisan.uk@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A565E0095F; Fri, 21 Apr 2017 09:32:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (max.malisan.uk[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.196 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F8E7E0074B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 09:32:06 -0700 (PDT)
Received: by mail-io0-f196.google.com with SMTP id x86so32044543ioe.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UHE2EcqZpTUT2VIIwp0V1+aKUYZEhTIz3bp3XMq7bBs=;
	b=NQSP4WGCdbBh3/QEayQX9uk9cjMqUjVNcexTPKUWzNOnGJ9VL5T4FGmPwovu27mPu5
	k6acgToREp62KoWCWUAxpt0lk8DFse2AJ9hbwmAmjBVf8kuVhxOAppg3VVzb2ellyCGb
	CpnxqfSUMuUT3X/6ps6ILHPv5ODCqUt4GV+1BzR4UzOr0Elv+9vp5f18v/JmanqzVwm3
	dMfuALC92BOkdrV+CDpsbsrrb83UsbY9kUQjt5xCHgF4NBM1EJPc+XHEi4QPVLiUQI2y
	N44lbI+9A/w1SRcwd9MNq+yNswPUbjKGI+qBJRvHo57MB8pn3mfzaRUZ9TyDs/vUoUcZ
	o03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UHE2EcqZpTUT2VIIwp0V1+aKUYZEhTIz3bp3XMq7bBs=;
	b=sr23GgrjIVOqOTNXFviRTEm+kmtbuH24Ccg88oQx/dN9XMra91dGJfE5bn4kFfGgqi
	II0/10nQH2hagVR2+tRvFWBtN+7h5W212ISJZo6Yukqy6egzXOjsgx298N9zdNqdUxw3
	3BwonVIDMzfii4SxVk06k+bHcQSPe9EJ4map4K/04akrLRhbGU7ibvcYKEBdVKh5mIaZ
	hNSnL0vgga+h/JXFXklJueDu45LV4aufdRZMomE+sPRgW17zIfDoOlL14zEGbhwNQTRL
	JpPUzFo/URSMjSDseL11kdEet8Zm8+9u6OLUADT6hP13FhnOXMv9XcQbCsm4cJa4U1m4
	7IGQ==
X-Gm-Message-State: AN3rC/4Ycbvt2H/hkXmdwJIdfPsPnelP6rrm9H/72WumSBcdt/gD9fEN
	x0Vx3xG4XVeWEXRIqJ7hLuwu+xoVTg==
X-Received: by 10.36.46.69 with SMTP id i66mr11281876ita.59.1492792325237;
	Fri, 21 Apr 2017 09:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.164.11 with HTTP; Fri, 21 Apr 2017 09:32:04 -0700 (PDT)
In-Reply-To: <CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
References: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
	<CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
From: Massimiliano Malisan <max.malisan.uk@gmail.com>
Date: Fri, 21 Apr 2017 17:32:04 +0100
Message-ID: <CADM9VcugBHcqoTADm32TAFON8jCS-EYEJcgCuDQKc=b75HZrpQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXD anyone?
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
X-List-Received-Date: Fri, 21 Apr 2017 16:32:14 -0000
Content-Type: multipart/alternative; boundary=001a114ab26c44f4be054dafccd7

--001a114ab26c44f4be054dafccd7
Content-Type: text/plain; charset=UTF-8

Hi,

well, it's a bit complicated: being a newbie of both Yocto and go-lang when
I started all this I wasn't aware of the introduction of go in the
openembedded-core meta master (I am using morty). As I couldn't sort out
quickly how to set up the recipe with the meta-virtualization go compiler I
switched all the meta to use meta-golang (quite an easy task), which seemed
to me much more easy to use and directly produced a building tree structure
similar to the one I got from "go get" of LXD source (which I used as a
reference to understand all the package's dependencies and go building
structure).

Besides this:
* I created a bunch of go recipes for all the dependencies (following the
example of docker's recipe dependencies)
* I added and/or updated few other recipes (some are added+updated from
meta-cube)
* I added/changed some system configuration files
* I added some kernel modules - but without a real knowledge of which are
strictly needed: I just checked those needed by docker (using the checking
script from coreos docker's repo -- https://github.com/coreos/d
ocker/blob/master/contrib/check-config.sh) and created corresponding kernel
scc and cfg files (I also updated the docker's ones but this is a
collateral and I don't know if it's needed).

Now I got a bit more insight on the overall process I may try to update the
recipes to use the new go compiler structure (but for the moment I still
need to keep it working for morty.. and I wouldn't like to keep two
different versions of the recipes).

By the way, now LXD seems to be working on my test image; there are still
few thing I have to do manually after the installation (which should be
automatized within the building process and I haven't been able to, yet)
and few "side" things missing:
* I could not build criu (as per previous message to the list) which is
indicated as a tool to be used together with LXD on the build instructions
* I have not been able to use it with apparmor (I didn't manage to build it
from the meta-security)
* In his blog, LXD main developer suggests to use ZFS as ideal container fs
but it's currently missing from Yocto...

If all this seems reasonable (and if you give me some links where to read
how to upload or send the recipes and patches I did) I will be happy to
contribute..

Cheers,
    Max


On 20 April 2017 at 16:10, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

>
>
> On Thu, Apr 20, 2017 at 10:00 AM, Massimiliano Malisan <
> max.malisan.uk@gmail.com> wrote:
>
>> Hi all,
>>
>> is anyone currently working on creating a recipe for LXD?
>>
>
> We started creating one about a year ago (and it was discussed, but I
> can't find a reference now) .. but that effort never did make it into the
> tree and has bit rotted now.
>
> So if you have something underway, and are looking for input, feel free to
> post RFC patches and we can see what's working (or not!).
>
> Cheers,
>
> Bruce
>
>
>>
>> I have been working on one in the last days but I still have some issues
>> to have it run properly; being quite new to Yocto I am not sure if they
>> depend on something in my recipe or some other missing dependency or
>> configuration, so any other voice is more than welcome.
>>
>> Cheers,
>>     Max
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a114ab26c44f4be054dafccd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>well, it&#39;s a bit complicated: b=
eing a newbie of both Yocto and go-lang when I started all this I wasn&#39;=
t aware of the introduction of go in the openembedded-core meta master (I a=
m using morty).=C2=A0As I couldn&#39;t sort out quickly how to set up the r=
ecipe with the meta-virtualization go compiler I switched all the meta to u=
se meta-golang (quite an easy task), which seemed to me much more easy to u=
se and directly produced a building tree structure similar to the one I got=
 from &quot;go get&quot; of LXD source (which I used as a reference to unde=
rstand all the package&#39;s dependencies and go building structure).</div>=
<div><br></div><div>Besides this:</div><div>* I created a bunch of go recip=
es for all the dependencies (following the example of docker&#39;s recipe d=
ependencies)</div><div>* I added and/or updated few other recipes (some are=
 added+updated from meta-cube)</div><div>* I added/changed some system conf=
iguration files</div><div>* I added some kernel modules - but without a rea=
l knowledge of which are strictly needed: I just checked those needed by do=
cker (using the checking script from coreos docker&#39;s repo --=C2=A0<a hr=
ef=3D"https://github.com/coreos/docker/blob/master/contrib/check-config.sh"=
 target=3D"_blank">https://github.com/coreos/d<wbr>ocker/blob/master/contri=
b/chec<wbr>k-config.sh</a>) and created corresponding kernel scc and cfg fi=
les (I also updated the docker&#39;s ones but this is a collateral and I do=
n&#39;t know if it&#39;s needed).</div><div><br></div><div>Now I got a bit =
more insight on the overall process I may try to update the recipes to use =
the new go compiler structure (but for the moment I still need to keep it w=
orking for morty.. and I wouldn&#39;t like to keep two different versions o=
f the recipes).</div><div><br></div><div>By the way, now LXD seems to be wo=
rking on my test image; there are still few thing I have to do manually aft=
er the installation (which should be automatized within the building proces=
s and I haven&#39;t been able to, yet) and few &quot;side&quot; things miss=
ing:</div><div>* I could not build criu (as per previous message to the lis=
t) which is indicated as a tool to be used together with LXD on the build i=
nstructions</div><div>* I have not been able to use it with apparmor (I did=
n&#39;t manage to build it from the meta-security)</div><div>* In his blog,=
 LXD main developer suggests to use ZFS as ideal container fs but it&#39;s =
currently missing from Yocto...</div><div><br></div><div>If all this seems =
reasonable (and if you give me some links where to read how to upload or se=
nd the recipes and patches I did) I will be happy to contribute..</div><div=
><br></div><div>Cheers,</div><div>=C2=A0 =C2=A0 Max</div><div><br></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 20 April 2017 at =
16:10, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><b=
r><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span>On Thu, A=
pr 20, 2017 at 10:00 AM, Massimiliano Malisan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:max.malisan.uk@gmail.com" target=3D"_blank">max.malisan.uk@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div>Hi all,=C2=A0<br></div><div><br></div><div>is an=
yone currently working on creating a recipe for LXD?<br></div></div></block=
quote><div><br></div></span><div>We started creating one about a year ago (=
and it was discussed, but I can&#39;t find a reference now) .. but that eff=
ort never did make it into the tree and has bit rotted now.<br></div><div><=
br></div><div>So if you have something underway, and are looking for input,=
 feel free to post RFC patches and we can see what&#39;s working (or not!).=
</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span><div di=
r=3D"ltr"><div></div><div><br></div><div>I have been working on one in the =
last days but I still have some issues to have it run properly; being quite=
 new to Yocto I am not sure if they depend on something in my recipe or som=
e other missing dependency or configuration, so any other voice is more tha=
n welcome.</div><div><br></div><div>Cheers,</div><div>=C2=A0 =C2=A0 Max</di=
v></div>
<br></span><span class=3D"gmail-m_-4040689106219897799gmail-m_-919228296393=
4996079HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"gmail-m_-40406891062198=
97799gmail-m_-9192282963934996079HOEnZb"><font color=3D"#888888"><br><br cl=
ear=3D"all"><div><br></div>-- <br><div class=3D"gmail-m_-404068910621989779=
9gmail-m_-9192282963934996079m_-7939722327411209343gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</font></span></div></div>
</blockquote></div><br></div></div>

--001a114ab26c44f4be054dafccd7--
