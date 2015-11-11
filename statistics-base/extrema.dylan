Module: statistics-base
Synopsis: Implementations of various algorithms for calculating a mean.
Author: Bruce Mitchener, Jr.
Copyright: See LICENSE file in this distribution.

define method minimum+maximum
    (sample :: limited(<vector>, of: <double-float>))
 => (minimum :: <double-float>, maximum :: <double-float>)
  let minimum :: <double-float> = sample[0];
  let maximum :: <double-float> = sample[0];
  for (d in sample)
    if (d < minimum)
      minimum := d;
    elseif (d > maximum)
      maximum := d;
    end if;
  end for;
  values(minimum, maximum)
end method minimum+maximum;

define method minimum
    (sample :: limited(<vector>, of: <double-float>))
 => (minimum :: <double-float>)
  for (d in sample,
       minimum :: <double-float> = sample[0] then min(minimum, d))
  finally
    minimum
  end for
end method minimum;

define method minimum/trimmed
    (sample :: limited(<vector>, of: <double-float>),
     lower-limit :: <double-float>,
     #key inclusive? = #t)
 => (minimum :: <double-float>)
  for (d in sample,
       minimum :: <double-float> = sample[0]
         then if (inclusive?)
                if (d < lower-limit)
                  minimum
                else
                  min(minimum, d)
                end if
              else
                if (d <= lower-limit)
                  minimum
                else
                  min(minimum, d)
                end if
              end if)
  finally
    minimum
  end for
end method minimum/trimmed;

define method maximum
    (sample :: limited(<vector>, of: <double-float>))
 => (maximum :: <double-float>)
  for (d in sample,
       maximum :: <double-float> = sample[0] then max(maximum, d))
  finally
    maximum
  end for
end method maximum;

define method maximum/trimmed
    (sample :: limited(<vector>, of: <double-float>),
     lower-limit :: <double-float>,
     #key inclusive? = #t)
 => (maximum :: <double-float>)
  for (d in sample,
       maximum :: <double-float> = sample[0]
         then if (inclusive?)
                if (d > lower-limit)
                  maximum
                else
                  max(maximum, d)
                end if
              else
                if (d >= lower-limit)
                  maximum
                else
                  max(maximum, d)
                end if
              end if)
  finally
    maximum
  end for
end method maximum/trimmed;