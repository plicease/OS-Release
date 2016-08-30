#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

MODULE = OS::Release PACKAGE = OS::Release

SV*
_parse()
  INIT:
    HV *result;
    FILE *fp;
    char buf[1024];
  CODE:
    fp = fopen("/etc/os-release", "r");
    if(fp == NULL)
    {
      XSRETURN_EMPTY;
    }
    
    result = newHV();
    
    while(fgets(buf, sizeof(buf), fp))
    {
      char *value, *p, *q;
      
      /* Ignore comments */
      if(buf[0] == '#')
        continue;
      
      /* Split into name=value */
      p = strchr(buf, '=');
      if(!p)
        continue;
      *p++ = 0;
      
      /* Remove quotes and new line; un-escape */
      value = p;
      q=p;
      while(*p)
      {
        if(*p == '\\')
        {
          ++p;
          if(!*p)
            break;
          *q++ = *p++;
        }
        else if(*p == '\'' || *p == '"' || *p == '\n')
        {
          ++p;
        }
        else
        {
          *q++ = *p++;
        }
      }
      *q = 0;
      hv_store(result, buf, strlen(buf), newSVpv(value, strlen(value)), 0);
    }
    fclose(fp);
    RETVAL = newRV_noinc((SV*)result);
  OUTPUT:
    RETVAL
