Return-Path: <ray.danks@se-eng.com>
Received: from judge.camp.se-eng.com
	(75-148-42-21-Colorado.hfc.comcastbusiness.net [75.148.42.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69F96E006C3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Dec 2012 10:57:15 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 437D5138077
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Dec 2012 11:57:14 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WvnbTkpXBL4q for <meta-virtualization@yoctoproject.org>; 
	Wed,  5 Dec 2012 11:57:12 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 971F7138015
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Dec 2012 11:57:12 -0700 (MST)
Message-ID: <50BF9906.6080108@se-eng.com>
Date: Wed, 05 Dec 2012 11:57:10 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com>
Subject: Re: meta-virtualization structure
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ray.danks@se-eng.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:57:15 -0000
Content-Type: multipart/alternative;
	boundary="------------040005080607090408020609"

--------------040005080607090408020609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2012 05:02 AM, Prica, Mihai wrote:
>
> Hi,
>
> I wanted to include my work with meta-kvm into the new 
> layer(meta-virtualization) and I was thinking about the best method of 
> doing this.  The problem is there are different kernel configs 
> depending on the hypervisor and different values for the PACKAGECONFIG 
> in libvirt.
>
> One solution would be to move all the common pieces into a meta layer 
> and group the hypervisor configurations into a specific directory 
> (meta-kvm, meta-xen), all of them in meta-virtualization. Is there 
> another way ?
>

It seems to me the choice of hypervisor should be made in the distro 
configuration.  Can't this be handled with the addition of a HYPERVISOR 
definition there?

> Thanks,
>
> Mihai
>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


--------------040005080607090408020609
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/05/2012 05:02 AM, Prica, Mihai
      wrote:<br>
    </div>
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi,<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I wanted to include my work with meta-kvm
          into the new layer(meta-virtualization) and I was thinking
          about the best method of doing this. &nbsp;The problem is there are
          different kernel configs depending on the hypervisor and
          different values for the PACKAGECONFIG in libvirt. <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">One solution would be to move all the
          common pieces into a meta layer and group the hypervisor
          configurations into a specific directory (meta-kvm, meta-xen),
          all of them in meta-virtualization. Is there another way ?</p>
      </div>
    </blockquote>
    <br>
    It seems to me the choice of hypervisor should be made in the distro
    configuration.&nbsp; Can't this be handled with the addition of a
    HYPERVISOR definition there?<br>
    <br>
    <blockquote
cite="mid:97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Mihai<o:p></o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-virtualization mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-virtualization">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040005080607090408020609--
